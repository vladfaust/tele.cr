require "json"
require "../type"

module Tele
  module Types
    class KeyboardButton < Type
      JSON.mapping({
        text:             {type: String},
        request_contact:  {type: Bool?},
        request_location: {type: Bool?},
      })
    end
  end
end
