require "./input_message_content"

module Tele
  module Types
    class InputTextMessageContent < InputMessageContent
      MAPPING = {
        message_text:             {type: String},
        parse_mode:               {type: String?},
        disable_web_page_preview: {type: Bool?},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
