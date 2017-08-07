require "../type"

module Tele
  module Types
    class WebhookInfo < Type
      mapping({
        url:                    {type: String},
        has_custom_certificate: {type: Bool},
        pending_update_count:   {type: Int32},
        last_error_date:        {type: Int32?},
        last_error_message:     {type: String?},
        max_connections:        {type: Int32?},
        allowed_updates:        {type: Array(String)?},
      })
    end
  end
end
