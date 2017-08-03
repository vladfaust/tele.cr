require "./base"

module Actions
  module Inline
    class Dislike < Base
      def text
        "You've disliked " + @id.to_s + "!"
      end
    end
  end
end
