require "./input_message_content.cr"

module Tele
  module Types
    class InputContactMessageContent < InputMessageContent
      mapping({
        phone_number: {type: String},
        first_name:   {type: String},
        last_name:    {type: String?},
      })
    end
  end
end
