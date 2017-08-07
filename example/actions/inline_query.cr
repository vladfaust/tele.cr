require "../responders/inline_query"
require "../../src/tele/types/inline_query_results/article"
require "../../src/tele/types/input_text_message_content"

module Actions
  class InlineQuery < Tele::Action
    def perform
      results = [] of Tele::Types::InlineQueryResult
      10.times do |i|
        results << Tele::Types::InlineQueryResults::Article.new(
          id: (i + 1).to_s,
          title: "Title for ##{i + 1}",
          input_message_content: Tele::Types::InputTextMessageContent.new(message_text: "Selected ##{i + 1}"),
        )
      end
      Responders::InlineQuery.new(update, results).respond
    end
  end
end
