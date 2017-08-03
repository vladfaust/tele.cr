require "http/client"
require "uri"
require "json"

module Tele
  # A basic HTTP(S) Client for Telegam API
  # TODO: Client reusage (pool?)
  class Client
    BASE_URI = URI.parse("https://api.telegram.org")

    @client : HTTP::Client

    def initialize(@token : String)
      @client = HTTP::Client.new(BASE_URI)
    end

    def make_request(method, payload, cast_to : Type.class | Nil.class | Nil = nil)
      response = @client.post("/bot" + @token + "/" + method, body: payload.to_json, headers: HTTP::Headers{"Content-Type" => "application/json"})
      if response.status_code == 200
        if cast_to && cast_to.class != Nil.class
          cast_to.from_json(JSON.parse(response.body.not_nil!)["result"].to_json)
        else
          JSON.parse(response.body.not_nil!)
        end
      end
    end
  end
end
