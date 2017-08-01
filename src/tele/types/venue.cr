require "./location"

module Tele
  module Types
    class Venue
      JSON.mapping({
        location:      {type: Location},
        title:         {type: String},
        address:       {type: String},
        foursquare_id: {type: String?},
      })
    end
  end
end
