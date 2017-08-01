require "./types/webhook_info"
require "./types/user"

module Tele
  module APIMethods
    def get_me
      make_request("getMe", cast_to: Types::User)
    end

    # See https://core.telegram.org/bots/api#setwebhook
    # TODO: Implement *certificate*
    def set_webhook(url : URI, max_connections : Int32? = 40, allowed_updates : Array(String)? = nil)
      make_request("setWebhook", {"url" => url.to_s, "max_connections" => max_connections, "allowed_updates" => allowed_updates})
    end

    def delete_webhook
      make_request("deleteWebhook")
    end

    def get_webhook_info
      make_request("getWebhookInfo", cast_to: Types::WebhookInfo)
    end
  end
end
