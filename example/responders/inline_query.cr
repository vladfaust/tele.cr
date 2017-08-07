require "../../src/tele/requests/answer_inline_query"

module Responders
  class InlineQuery < Tele::Responder
    # FIXME: Remove default *results* value
    def initialize(update, @results : Array(Tele::Types::InlineQueryResult)? = nil)
      super(update)
    end

    def respond
      R::AnswerInlineQuery.new(
        inline_query_id: update.inline_query.not_nil!.id,
        results: @results.not_nil!,
        cache_time: 0,
        is_personal: true,
      )
    end
  end
end
