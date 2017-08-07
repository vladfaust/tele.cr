require "../type"
require "./labeled_price"

module Tele
  module Types
    class ShippingOption < Type
      mapping({
        id:     {type: String},
        title:  {type: String},
        prices: {type: Array(LabeledPrice)},
      })
    end
  end
end
