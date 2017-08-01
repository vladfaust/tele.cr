require "logger"
require "http/server/handler"

module Tele
  class ElapsedTimeLogger
    include HTTP::Handler

    private getter logger : Logger
    private getter log_header : String

    def initialize(@logger, @log_header)
    end

    def call(context)
      time = Time.now
      call_next(context)
      logger.info log_header + "handled in " + elapsed(Time.now - time)
    end

    private def elapsed(time)
      minutes = time.total_minutes
      return "#{minutes.round(2)}m" if minutes >= 1

      seconds = time.total_seconds
      return "#{seconds.round(2)}s" if seconds >= 1

      millis = time.total_milliseconds
      return "#{millis.round(2)}ms" if millis >= 1

      "#{(millis * 1000).round(2)}µs"
    end
  end
end
