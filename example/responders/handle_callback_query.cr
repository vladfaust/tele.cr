require "../../src/tele/requests/answer_callback_query"

module Responders
  class HandleCallbackQuery < Tele::Responder
    # FIXME: Remove default *text* value (see https://github.com/vladfaust/tele.cr/issues/1)
    def initialize(update, @text : String? = nil)
      super(update)
    end

    def respond
      # TODO: Handle cases when "message content and message date will not be available if the message is too old", read more @ https://core.telegram.org/bots/api#callbackquery
      R::AnswerCallbackQuery.new(
        callback_query_id: update.callback_query.not_nil!.id,
        text: @text,
      )
    end
  end
end
