require "../type"
require "./user"
require "./order_info"

module Tele
  module Types
    struct PreCheckoutQuery < Type
      mapping({
        id:                 {type: String},
        from:               {type: User},
        currency:           {type: String},
        total_amount:       {type: Int32},
        invoice_payload:    {type: String},
        shipping_option_id: {type: String?},
        order_info:         {type: OrderInfo?},
      })
    end
  end
end
