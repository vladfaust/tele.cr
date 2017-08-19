require "logger"
require "colorize"
require "uri"
require "http/server"
require "./client"
require "./handlers/*"
require "./middleware/*"
require "./types/update"
require "./requests/set_webhook"
require "./version"

module Tele
  abstract class Bot
    @@color : Symbol = :cyan      # Used in logs
    @@name : String = "Tele::Bot" # Used to colorize logs 🌈

    # Initialize a new instance of the bot and bind it to *port*.
    # To start listening to updates, use `#listen`.
    def initialize(@token : String, @port : Int32, @logger : Logger)
      @server = HTTP::Server.new(port, middleware) do |context|
        update = Tele::Types::Update.from_json(context.request.body.not_nil!)

        handler = handle(update)
        next context.response.close if handler == nil

        if response = handler.not_nil!.call(update)
          response_data = Tele::Client.new(token).build_request(response.to_h)
          @logger.debug(log_header + "responding with #{response_data}")

          context.response.headers.merge!(response_data[:headers])
          context.response.print(response_data[:body])
        else
          # If there is no response, just answer with 200
          @logger.debug(log_header + "empty response")
          context.response.close
        end
      end
      logger.info(log_header + "using Tele v#{VERSION} by @vladfaust")
    end

    def set_webhook(uri : URI, max_connections = 40, allowed_updates = nil)
      Requests::SetWebhook.new(uri.to_s, max_connections, allowed_updates).send(token)
      logger.info(log_header + "webhook set to " + uri.to_s.colorize.mode(:bold).to_s)
    end

    def listen
      logger.info(log_header + "listening on port " + port.to_s.colorize.mode(:bold).to_s)

      @server.listen
    end

    protected getter token, port, logger

    # Prepended to most of bot's logs ("INFO -- : LogHeader @ text")
    protected def log_header
      @@name.colorize(@@color).mode(:bold).to_s + " @ "
    end

    private def middleware
      [ElapsedTimeLogger.new(logger, log_header), UpdatesLogger.new(logger, log_header, @@color)]
    end

    private abstract def handle(update : Tele::Types::Update) : Tele::Handler.class | Proc | ::Nil
  end
end
