require "./user"
require "./message"

module Tele
  module Types
    class CallbackQuery
      JSON.mapping({
        id:                {type: String},
        from:              {type: User},
        message:           {type: Message?},
        inline_message_id: {type: String?},
        chat_instance:     {type: String},
        data:              {type: String?},
        game_short_name:   {type: String?},
      })
    end
  end
end
