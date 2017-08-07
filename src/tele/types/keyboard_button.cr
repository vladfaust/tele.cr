require "json"
require "../type"
require "./macros"

module Tele
  module Types
    class KeyboardButton < Type
      MAPPING = {
        text:             {type: String},
        request_contact:  {type: Bool?},
        request_location: {type: Bool?},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
