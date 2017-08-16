require "../handler"
require "../requests/answer_callback_query"

module Tele
  module Handlers
    # See `example/actions/inline_query.cr` for extended example
    #
    # ```
    # class MyHandler < Tele::Handlers::InlineQuery
    #   def call
    #     answer_callback_query(results)
    #   end
    # end
    # ```
    abstract class CallbackQuery < Handler
      protected def callback_query
        update.callback_query.not_nil!
      end

      protected def answer_callback_query(**args)
        R::AnswerCallbackQuery.new(callback_query.id, **args)
      end
    end
  end
end
