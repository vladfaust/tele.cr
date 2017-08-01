require "./input_message_content"

module Tele
  module Types
    class InputLocationMessageContent < InputMessageContent
      JSON.mapping({
        latitude:  {type: String},
        longitude: {type: String},
      })
    end
  end
end
