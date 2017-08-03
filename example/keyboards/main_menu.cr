require "../../src/tele/keyboards/reply"

module Keyboards
  class MainMenu < Tele::Keyboards::Reply
    BANANA = "🍌 Bananas"
    CHERRY = "🍒 Cherry"
    INLINE = "🤖 Inline message"

    def initialize
      @buttons.push([Button.new(BANANA), Button.new(CHERRY)])
      @buttons << [Button.new(INLINE)]
      super(one_time_keyboard: true)
    end
  end
end
