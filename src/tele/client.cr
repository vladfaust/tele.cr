require "http/client"
require "http/formdata"
require "http/multipart"
require "uri"
require "json"
require "mime"
require "logger"

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

    # TODO: Handle Telegram error responses
    def request(method, payload = {} of String => String, cast_to : Type.class | Nil.class | Nil = nil)
      id = rand(1000)
      request = build_request(payload)

      @logger.debug("Tele::Client @ post request ##{id} to /#{method} with payload #{request}")

      response = @client.post("/bot" + @token + "/" + method, **request)

      body = response.body.to_s
      @logger.debug("Tele::Client @ response ##{id}: #{body.to_s}")

      if response.status_code == 200
        if cast_to && !cast_to.nilable?
          cast_to.from_json(JSON.parse(body)["result"].to_json)
        else
          JSON.parse(body)
        end
      end
    end
  end
end
