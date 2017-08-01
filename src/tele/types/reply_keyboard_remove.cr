require "json"
require "../type"

module Tele
  module Types
    class ReplyKeyboardRemove < Type
      JSON.mapping({
        remove_keyboard: {type: Bool, mustbe: true},
        selective:       {type: Bool?},
      })
    end
  end
end
