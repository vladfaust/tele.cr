require "../request"

module Tele
  module Requests
    class GetWebhookInfo < Request(Types::WebhookInfo)
    end
  end
end
