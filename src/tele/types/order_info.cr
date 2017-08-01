require "./shipping_address"

module Tele
  module Types
    class OrderInfo
      JSON.mapping({
        name:             {type: String?},
        phone_number:     {type: String?},
        email:            {type: String?},
        shipping_address: {type: ShippingAddress?},
      })
    end
  end
end
