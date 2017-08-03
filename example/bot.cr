require "../src/tele"
require "./handlers/update_id_handler"
require "./actions/**"
require "./responders/**"
require "option_parser"

token = host = ""
port = 5000

OptionParser.parse! do |parser|
  parser.banner = "Usage: crystal tele/example/bot.cr -- -t <TOKEN> -h <HOST> -p <PORT>"
  parser.on("-t TOKEN", "--token=TOKEN", "(Required) Telegram Bot token") { |t| token = t }
  parser.on("-h HOST", "--host=HOST", "(Required) Host for webhooks (use ngrok.io for local development)") { |h| host = h }
  parser.on("-p PORT", "--port=PORT", "(Optional) Local port to listen on (usually 5000)") { |p| port = p.to_i }
  parser.on("-h", "--help", "Show this help") { puts parser }
  parser.missing_option do |option|
    if %w(-t -h).includes?(option)
      puts parser
      exit
    end
  end
end

class ExampleBot < Tele::Bot
  @@name = "ExampleBot"   # Used in logs
  @@color = :light_yellow # Used to colorize logs 🌈

  def handlers
    [
      # This one colorfuly logs time elapsed for handling the whole request
      # E.g. `$ ExampleBot @ handled in 352.0µs`
      Tele::ElapsedTimeLogger.new(logger, log_header),

      # This one colorfuly logs incoming updates
      # E.g. `$ ExampleBot @ incoming text message from user @vladfaust (id 42): "/start"`
      Tele::UpdatesLogger.new(logger, log_header, @@color),
    ]
  end

  def map(update)
    if message = update.message
      text = update.message.not_nil!.text
      if text
        case text
        when /^\/start/
          return Actions::Start
        when "/inline", Keyboards::MainMenu::INLINE
          return Responders::Inline
        when Keyboards::MainMenu::BANANA
          return Responders::Banana
        else
          return Responders::DontUnderstand
        end
      else
        return Responders::DontUnderstand
      end
    elsif callback_query = update.callback_query
      case update.callback_query.not_nil!.data
      when /^like:\d+/
        return Actions::Inline::Like
      when /^dislike:\d+/
        return Actions::Inline::Dislike
      end
    end
    return nil
  end
end

if token && port && host
  bot = ExampleBot.new(token, port, Logger.new(STDOUT).tap { |l| l.level = Logger::DEBUG })
  bot.set_webhook(URI.new(scheme: "https", host: host))
  bot.listen
end
