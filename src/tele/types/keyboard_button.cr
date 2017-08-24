require "../type"
require "./macros"

module Tele
  module Types
    struct KeyboardButton < Type
      mapping({
        text:             {type: String},
        request_contact:  {type: Bool?},
        request_location: {type: Bool?},
      })
    end
  end
end
