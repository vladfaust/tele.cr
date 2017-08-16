require "../handler"
require "../requests/answer_inline_query"

module Tele
  module Handlers
    # See `example/actions/inline_query.cr` for extended example
    #
    # ```
    # class MyHandler < Tele::Handlers::InlineQuery
    #   def results
    #   end
    #
    #   def call
    #     answer_inline_query(results)
    #   end
    # end
    # ```
    abstract class InlineQuery < Handler
      protected def inline_query
        update.inline_query.not_nil!
      end

      protected def answer_inline_query(**args)
        R::AnswerInlineQuery.new(inline_query.id, **args)
      end
    end
  end
end
