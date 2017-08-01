require "./user"
require "./location"

module Tele
  module Types
    class InlineQuery
      JSON.mapping({
        id:       {type: String},
        from:     {type: User},
        location: {type: Location?},
        query:    {type: String},
        offset:   {type: String},
      })
    end
  end
end
