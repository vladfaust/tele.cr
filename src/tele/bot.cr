require "logger"
require "colorize"
require "uri"
require "./client"
require "./action"
require "./responder"
require "./handlers/*"
require "./types/**"
require "./requests/**"

module Tele
  abstract class Bot
    @@color : Symbol = :cyan
    @@name : String = "Tele::Bot"

    # Initializes a new instance of the bot and binds it to *port*.
    # To start listening to updates, use `#listen`.
    def initialize(@token : String, @port : Int32, @logger : Logger)
      @server = HTTP::Server.new(port, handlers) do |context|
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
          context.response.content_type = "application/json"
          context.response.print(response.to_json)
        else
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

    protected def log_header
      @@name.colorize(@@color).mode(:bold).to_s + " @ "
    end

    private def handlers
      [UpdatesLogger.new(logger, log_header)]
    end

    private abstract def map(update : Tele::Types::Update) : Tele::Action.class | Tele::Responder.class | ::Nil
  end
end
