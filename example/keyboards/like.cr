require "../../src/tele/keyboards/inline"

module Keyboards
  class Like < Tele::Keyboards::Inline
    def initialize
      @buttons << [
        Button.new(text: "👍", callback_data: "like"),
      ]
    end
  end
end
