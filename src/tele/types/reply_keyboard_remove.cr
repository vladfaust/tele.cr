require "json"
require "../type"
require "./macros"

module Tele
  module Types
    class ReplyKeyboardRemove < Type
      include Macros

      MAPPING = {
        remove_keyboard: {type: Bool, default: true},
        selective:       {type: Bool?},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
