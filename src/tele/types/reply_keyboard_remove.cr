require "../type"
require "./macros"

module Tele
  module Types
    class ReplyKeyboardRemove < Type
      mapping({
        remove_keyboard: {type: Bool, default: true},
        selective:       {type: Bool?},
      })
    end
  end
end
