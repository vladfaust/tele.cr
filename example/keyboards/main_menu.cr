require "../../src/tele/keyboards/reply"

module Keyboards
  class MainMenu < Tele::Keyboards::Reply
    BANANA    = "🍌 Get bananas"
    HIDE_MENU = "❌ Hide menu"
    INLINE    = "🤖 Inline message"

    def initialize
      @buttons.push([Button.new(BANANA), Button.new(INLINE)])
      @buttons << [Button.new(HIDE_MENU)]
      super
    end
  end
end
