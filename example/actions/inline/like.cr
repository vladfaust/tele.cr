require "./base"

module Actions
  module Inline
    class Like < Base
      def text
        "You've liked " + @id.to_s + "!"
      end
    end
  end
end
