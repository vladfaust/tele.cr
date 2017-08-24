require "../type"

module Tele
  module Types
    struct ShippingAddress < Type
      mapping({
        country_code: {type: String},
        state:        {type: String},
        city:         {type: String},
        street_line1: {type: String},
        street_line2: {type: String},
        post_code:    {type: String},
      })
    end
  end
end
