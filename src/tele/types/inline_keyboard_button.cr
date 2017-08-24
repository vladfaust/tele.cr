require "../type"
require "./macros"

module Tele
  module Types
    struct InlineKeyboardButton < Type
      mapping({
        text:                {type: String},
        url:                 {type: String?},
        callback_data:       {type: String?},
        switch_inline_query: {type: String?},
      })
    end
  end
end
