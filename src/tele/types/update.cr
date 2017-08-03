require "../type"
require "./message"
require "./inline_query"
require "./chosen_inline_result"
require "./callback_query"
require "./shipping_query"
require "./pre_checkout_query"

module Tele
  module Types
    class Update < Type
      JSON.mapping({
        update_id:            {type: Int32},
        message:              {type: Message?},
        edited_message:       {type: Message?},
        channel_post:         {type: Message?},
        edited_channel_post:  {type: Message?},
        inline_query:         {type: InlineQuery?},
        chosen_inline_result: {type: ChosenInlineResult?},
        callback_query:       {type: CallbackQuery?},
        shipping_query:       {type: ShippingQuery?},
        pre_checkout_query:   {type: PreCheckoutQuery?},
      })
    end
  end
end
