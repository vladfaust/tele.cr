require "../../src/tele/types/inline_query_results/article"
require "../../src/tele/types/input_text_message_content"

module Handlers
  class InlineQuery < Tele::Handlers::InlineQuery
    def call
      results = [] of Tele::Types::InlineQueryResult

      10.times do |i|
        results << Tele::Types::InlineQueryResults::Article.new(
          id: (i + 1).to_s,
          title: "Title for ##{i + 1}",
          input_message_content: Tele::Types::InputTextMessageContent.new(message_text: "Selected ##{i + 1}"),
        )
      end

      answer_inline_query(
        results: results,
        cache_time: 0,
        is_personal: true,
      )
    end
  end
end
