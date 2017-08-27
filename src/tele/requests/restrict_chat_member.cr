require "../request"

module Tele
  module Requests
    class RestrictChatMember < Request(Nil)
      map({
        chat_id:                   {type: Int32 | String},
        user_id:                   {type: Int32},
        until_date:                {type: Int32?},
        can_send_messages:         {type: Bool?},
        can_send_media_messages:   {type: Bool?},
        can_send_other_messages:   {type: Bool?},
        can_add_web_page_previews: {type: Bool?},
      })
    end
  end
end
