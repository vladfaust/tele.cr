require "json"
require "../type"

module Tele
  module Types
    class InlineKeyboardButton < Type
      JSON.mapping({
        text:                {type: String},
        url:                 {type: String?},
        callback_data:       {type: String?},
        switch_inline_query: {type: String?},
      })
    end
  end
end
