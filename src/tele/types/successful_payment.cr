require "./order_info"

module Tele
  module Types
    class SuccessfulPayment
      JSON.mapping({
        currency:                   {type: String},
        total_amount:               {type: Int32},
        invoice_payload:            {type: String},
        shipping_option_id:         {type: String?},
        order_info:                 {type: OrderInfo?},
        telegram_payment_charge_id: {type: String},
        provider_payment_charge_id: {type: String},
      })
    end
  end
end
