require "../../src/tele/keyboards/inline"

module Keyboards
  class Inline < Tele::Keyboards::Inline
    def initialize(id : Int32)
      @buttons << [
        Button.new(text: "👍", callback_data: "like:#{id}"),
        Button.new(text: "👎", callback_data: "dislike:#{id}"),
      ]
    end
  end
end
