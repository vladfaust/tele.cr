require "./input_message_content"

module Tele
  module Types
    class InputTextMessageContent < InputMessageContent
      mapping({
        message_text:             {type: String},
        parse_mode:               {type: String?},
        disable_web_page_preview: {type: Bool?},
      })
    end
  end
end
