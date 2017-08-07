require "../type"
require "./macros"

module Tele
  module Types
    class KeyboardButton < Type
      mapping({
        text:             {type: String},
        request_contact:  {type: Bool?},
        request_location: {type: Bool?},
      })
    end
  end
end
