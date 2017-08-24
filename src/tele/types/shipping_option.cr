require "../type"
require "./labeled_price"

module Tele
  module Types
    struct ShippingOption < Type
      mapping({
        id:     {type: String},
        title:  {type: String},
        prices: {type: Array(LabeledPrice)},
      })
    end
  end
end
