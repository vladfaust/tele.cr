require "json"
require "../type"
require "./macros"

module Tele
  module Types
    class InlineKeyboardButton < Type
      include Macros

      MAPPING = {
        text:                {type: String},
        url:                 {type: String?},
        callback_data:       {type: String?},
        switch_inline_query: {type: String?},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
