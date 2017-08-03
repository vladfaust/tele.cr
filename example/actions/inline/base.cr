require "../../responders/handle_callback_query"

module Actions
  module Inline
    abstract class Base < Tele::Action
      @id = uninitialized Int32

      def perform
        extract_id
        Responders::HandleCallbackQuery.new(update, text: text).respond
      end

      abstract def text : String

      def extract_id
        @id = /\d+/.match(update.callback_query.not_nil!.data.not_nil!).not_nil![0].to_i
      end
    end
  end
end
