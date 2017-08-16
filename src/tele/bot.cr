require "logger"
require "colorize"
require "uri"
require "http/server"
require "./client"
require "./action"
require "./responder"
require "./middleware/*"
require "./types/update"
require "./requests/set_webhook"

module Tele
  abstract class Bot
    @@color : Symbol = :cyan      # Used in logs
    @@name : String = "Tele::Bot" # Used to colorize logs 🌈

    # Initialize a new instance of the bot and bind it to *port*.
    # To start listening to updates, use `#listen`.
    def initialize(@token : String, @port : Int32, @logger : Logger)
      @server = HTTP::Server.new(port, middleware) do |context|
        update = Tele::Types::Update.from_json(context.request.body.not_nil!)

        action = map(update)
        next context.response.close if action == nil

        response = nil
        if action.is_a?(Tele::Action.class)
          action = action.new(update)
          response = action.perform
        elsif action.is_a?(Tele::Responder.class)
          responder = action
          response = responder.new(update).respond
        end

        if response
          response_data = Tele::Client.new(token).build_request(response.to_h)
          context.response.headers.merge!(response_data[:headers])
          context.response.print(response_data[:body])
        else
          # If there is no response, just answer with 200
          context.response.close
        end
      end
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
      [ElapsedTimeLogger.new(logger, log_header), UpdatesLogger.new(logger, log_header)]
    end

    private abstract def map(update : Tele::Types::Update) : Tele::Action.class | Tele::Responder.class | ::Nil
  end
end
