require "../type"
require "./user"
require "./message"

module Tele
  module Types
    struct CallbackQuery < Type
      mapping({
        id:                {type: String},
        from:              {type: User},
        chat_instance:     {type: String},
        message:           {type: Message?},
        inline_message_id: {type: String?},
        data:              {type: String?},
        game_short_name:   {type: String?},
      })
    end
  end
end
