require "http/client"
require "http/formdata"
require "http/multipart"
require "uri"
require "json"
require "mime"
require "logger"
require "./types/file"
require "./client/errors"

module Tele
  # A basic HTTP(S) Client for Telegam API
  # TODO: Client reusage (pool?)
  class Client
    BASE_URI = URI.parse("https://api.telegram.org")

    @client : HTTP::Client

    def initialize(@token : String, @logger : Logger = Logger.new(STDOUT))
      @client = HTTP::Client.new(BASE_URI)
    end

    class ::File
      def to_json(json)
        json.string(self.to_s)
      end
    end

    # If payload has IO::FileDescriptor, build Multipart, otherwise - JSON
    def build_request(payload : Hash(String, String | File)) : {headers: HTTP::Headers, body: String}
      if payload.values.any? &.is_a?(IO::FileDescriptor)
        io = IO::Memory.new
        builder = HTTP::FormData::Builder.new(io)

        payload.each do |key, value|
          if value.is_a?(IO::FileDescriptor)
            file = value.as(File)
            metadata = HTTP::FormData::FileMetadata.new(filename: File.basename(file.path))
            headers = HTTP::Headers{
              "Content-Type" => Mime.from_ext(File.extname(file.path)).to_s,
            }
            builder.file(key, file, metadata, headers)
          else
            builder.field(key, value.as(String))
          end
        end

        builder.finish

        {
          headers: HTTP::Headers{"Content-Type" => builder.content_type},
          body:    io.to_s,
        }
      else
        {
          headers: HTTP::Headers{"Content-Type" => "application/json"},
          body:    payload.to_json,
        }
      end
    end

    def request(method, payload = {} of String => String, cast_to : Type.class | Nil.class | Nil = nil, raise raise_on_error? : Bool = false)
      id = rand(1000)
      request = build_request(payload)

      @logger.debug("Tele::Client @ post request ##{id} to /#{method} with payload #{payload}")

      response = @client.post("/bot" + @token + "/" + method, **request)

      body = JSON.parse(response.body.to_s)
      @logger.debug("Tele::Client @ response ##{id}: #{body.to_s}")

      if response.status_code == 200
        if cast_to && !cast_to.nilable?
          cast_to.from_json(body["result"].to_json)
        else
          body
        end
      else
        raise_error(response.status_code, body) if raise_on_error?
        body
      end
    end

    def download_file(*, file_path : String) : IO
      id = rand(1000)
      @logger.debug("Tele::Client @ downloading file ##{id} with path #{file_path}")

      io = IO::Memory.new

      @client.get("/file/bot" + @token + "/" + file_path) do |response|
        IO.copy(response.body_io, io)
      end

      @logger.debug("Tele::Client @ downloaded file ##{id}, size: #{io.size} bytes")

      io
    end

    def download_file(file : Types::File)
      download_file(file_path: file.file_path)
    end

    def download_file(*, file_id : String)
      response = request("getFile", payload: {"file_id" => file_id}, cast_to: Types::File)
      if response && (file_path = response.as(Types::File).file_path)
        download_file(file_path: file_path)
      end
    end
  end
end
