module Tele
  class Client
    def raise_error(status_code : Int32, body : JSON::Any)
      description = body["description"].as_s

      case status_code
      when 400
        case description
        when /chat not found/
          raise ChatNotFoundError.new
        when /message is not modified/
          raise MessageNotModifiedError.new
        when /ENTITY_MENTION_USER_INVALID/
          raise InvalidUserMentionError.new
        when /need administrator rights in the channel chat/
          raise NotAnAdminError.new
        end
      when 403
        raise BlockedByUserError.new
      when 429
        delay = body["parameters"].try &.["retry_after"].as_i
        raise LimitExceededError.new(delay)
      when 500..599
        raise ServerError.new(body.to_s)
      end

      raise UnhandledError.new(body.to_s)
    end

    class ChatNotFoundError < Exception
    end

    class MessageNotModifiedError < Exception
    end

    class InvalidUserMentionError < Exception
    end

    class NotAnAdminError < Exception
    end

    class BlockedByUserError < Exception
    end

    class LimitExceededError < Exception
      getter delay : Int32

      def initialize(@delay)
        super()
      end
    end

    class ServerError < Exception
    end

    class UnhandledError < Exception
    end
  end
end
