require "./input_message_content"

module Tele
  module Types
    struct InputLocationMessageContent < InputMessageContent
      mapping({
        latitude:  {type: String},
        longitude: {type: String},
      })
    end
  end
end
