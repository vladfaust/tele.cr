require "../type"
require "./user"
require "./location"

module Tele
  module Types
    class ChosenInlineResult < Type
      mapping({
        result_id:         {type: String},
        from:              {type: User},
        query:             {type: String},
        location:          {type: Location?},
        inline_message_id: {type: String?},
      })
    end
  end
end
