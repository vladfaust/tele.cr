module Handlers
  module CallbackQuery
    abstract class Base < Tele::Handlers::CallbackQuery
      @id = uninitialized Int32

      def call
        extract_id
        answer_callback_query(text: text)
      end

      abstract def text : String

      def extract_id
        @id = /\d+/.match(callback_query.data.not_nil!).not_nil![0].to_i
      end
    end

    class Like < Base
      def text
        "You've liked " + @id.to_s + "!"
      end
    end

    class Dislike < Base
      def text
        "You've disliked " + @id.to_s + "!"
      end
    end
  end
end
