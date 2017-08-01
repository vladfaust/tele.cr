require "./user"
require "./location"

module Tele
  module Types
    class ChosenInlineResult
      JSON.mapping({
        result_id:         {type: String},
        from:              {type: User},
        location:          {type: Location?},
        inline_message_id: {type: String?},
        query:             {type: String},
      })
    end
  end
end
