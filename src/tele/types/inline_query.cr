require "../type"
require "./user"
require "./location"

module Tele
  module Types
    struct InlineQuery < Type
      mapping({
        id:       {type: String},
        from:     {type: User},
        query:    {type: String},
        offset:   {type: String},
        location: {type: Location?},
      })
    end
  end
end
