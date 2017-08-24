require "../type"
require "./location"

module Tele
  module Types
    struct Venue < Type
      mapping({
        location:      {type: Location},
        title:         {type: String},
        address:       {type: String},
        foursquare_id: {type: String?},
      })
    end
  end
end
