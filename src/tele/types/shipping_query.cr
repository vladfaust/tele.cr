require "./user"
require "./shipping_address"

module Tele
  module Types
    class ShippingQuery
      JSON.mapping({
        id:               {type: String},
        from:             {type: User},
        invoice_payload:  {type: String},
        shipping_address: {type: ShippingAddress},
      })
    end
  end
end
