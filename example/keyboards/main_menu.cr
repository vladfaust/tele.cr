require "../../src/tele/keyboards/reply"

module Keyboards
  class MainMenu < Tele::Keyboards::Reply
    def initialize(*args)
      @buttons << [Button.new("Foo")]
      @buttons << [Button.new("Bar")]
      super
    end
  end
end
