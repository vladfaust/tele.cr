require "logger"
require "http/server/handler"
require "../types/message"

module Tele
  class UpdatesLogger
    include HTTP::Handler

    private getter logger : Logger
    private getter log_header : String

    def initialize(@logger, @log_header, @color : Symbol = :white)
    end

    MESSAGE_TYPES = %w(text audio document photo sticker video voice video_note contact location venue new_chat_members left_chat_member new_chat_title new_chat_photo delete_chat_photo group_chat_created supergroup_chat_created channel_chat_created migrate_to_chat_id migrate_from_chat_id pinned_message invoice successful_payment)
    MAX_TEXT_SIZE = 50

    def call(context)
      if body = context.request.body
        tmp_body = IO::Memory.new
        bytes_read = IO.copy(body, tmp_body, limit: 1024 ** 2)
        tmp_body.rewind

        unless bytes_read == 1024 ** 2
          update = Tele::Types::Update.from_json(tmp_body.gets_to_end.to_s)

          if update.message
            message = update.message.not_nil!
            content = message_content(message)
            logger.info(log_header + "incoming " + colorize_update_type("#{message_type(message)} message") + " from " + pretty_chat(message.chat) + (content.size > 0 ? ": " + content : ""))
          elsif update.edited_message
            message = update.edited_message.not_nil!
            content = message_content(message)
            logger.info(log_header + "incoming " + colorize_update_type("edited #{message_type(message)} message") + " update from " + pretty_chat(message.chat) + (content.size > 0 ? ": " + content : ""))
          elsif update.channel_post
            message = update.channel_post.not_nil!
            content = message_content(message)
            logger.info(log_header + "incoming " + colorize_update_type("#{message_type(message)} channel post") + " from " + pretty_chat(message.chat) + (content.size > 0 ? ": " + content : ""))
          elsif update.edited_channel_post
            message = update.edited_channel_post.not_nil!
            content = message_content(message)
            logger.info(log_header + "incoming " + colorize_update_type("edited #{message_type(message)} channel post") + " update from " + pretty_chat(message.chat) + (content.size > 0 ? ": " + content : ""))
          elsif update.inline_query
            # Inline query
            inline_query = update.inline_query.not_nil!
            query = inline_query.query
            logger.info(log_header + "incoming " + colorize_update_type(("empty " if query.size == 0).to_s + "inline query") + (" \"#{query}\"" if query.size > 0).to_s + " from " + pretty_user(inline_query.from))
          elsif update.chosen_inline_result
            chosen_inline_result = update.chosen_inline_result.not_nil!
            query = chosen_inline_result.query
            if query.size == 0
              query = "empty query".colorize(:dark_gray).to_s
            else
              query = "query \"" + query + "\""
            end

            logger.info(log_header + "incoming " + colorize_update_type("chosen inline result") + " #" + chosen_inline_result.result_id.to_s + " from " + pretty_user(chosen_inline_result.from) + " after " + query)
          elsif update.callback_query
            callback_query = update.callback_query.not_nil!

            logger.info(log_header + "incoming " + colorize_update_type("callback query") + " with data \"#{callback_query.data}\" from " + pretty_user(callback_query.from))
          elsif update.shipping_query
            shipping_query = update.shipping_query.not_nil!

            logger.info(log_header + "incoming " + colorize_update_type("shipping query") + " from " + pretty_user(shipping_query.from))
          elsif update.pre_checkout_query
            pre_checkout_query = update.pre_checkout_query.not_nil!

            logger.info(log_header + "incoming " + colorize_update_type("pre checkout query") + " with amount " + pre_checkout_query.total_amount.to_s + " " + pre_checkout_query.currency + " from " + pretty_user(pre_checkout_query.from))
          else
            logger.warn(log_header + "incoming unknown update type!")
          end
        end

        tmp_body.rewind
        context.request.body = tmp_body
      end

      call_next(context) if self.next
    end

    private def message_type(message : Types::Message) : String
      {% for message_type in MESSAGE_TYPES %}
        return {{message_type}} if message.{{message_type.id}}
      {% end %}
      return "unknown"
    end

    private def message_content(message : Types::Message) : String
      message_type(message) == "text" ? "\"" + (message.text.not_nil!.size > MAX_TEXT_SIZE ? message.text.not_nil![0...MAX_TEXT_SIZE] + "..." : message.text.not_nil!) + "\"" : ""
    end

    private def pretty_chat(chat : Types::Chat)
      sender_type = chat.type == "private" ? "user" : chat.type

      sender_handler = ""
      if chat.username
        sender_handler = "@" + chat.username.not_nil!
      elsif chat.title
        sender_handler = chat.title.not_nil!
      elsif chat.first_name
        sender_handler = chat.first_name.not_nil! + " " + chat.last_name.to_s
        sender_handler = sender_handler.strip
      end

      if sender_handler.size > 0
        sender_handler = " " + sender_handler
      end

      sender_type + sender_handler.colorize(@color).mode(:bold).to_s + " (id " + chat.id.to_s + ")"
    end

    private def pretty_user(user : Types::User)
      handler = ""
      if user.username
        handler = "@" + user.username.not_nil!
      elsif user.first_name
        handler = user.first_name.not_nil! + " " + user.last_name.to_s
        handler = handler.strip
      end

      handler.colorize(@color).mode(:bold).to_s + " (id " + user.id.to_s + ")"
    end

    private def colorize_update_type(t)
      t.colorize(@color).mode(:bold).to_s
    end
  end
end
