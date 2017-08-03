require "../request"
require "../types/webhook_info"

module Tele
  module Requests
    class GetWebhookInfo < Request(Types::WebhookInfo)
    end
  end
end
