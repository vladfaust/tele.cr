require "../type"

module Tele
  module Types
    class ChatMember < Type
      mapping({
        user:                      {type: User},
        status:                    {type: String},
        until_date:                {type: Int32?},
        can_be_edited:             {type: Bool?},
        can_change_info:           {type: Bool?},
        can_post_messages:         {type: Bool?},
        can_edit_messages:         {type: Bool?},
        can_delete_messages:       {type: Bool?},
        can_invite_users:          {type: Bool?},
        can_restrict_members:      {type: Bool?},
        can_pin_messages:          {type: Bool?},
        can_promote_members:       {type: Bool?},
        can_send_messages:         {type: Bool?},
        can_send_media_messages:   {type: Bool?},
        can_send_other_messages:   {type: Bool?},
        can_add_web_page_previews: {type: Bool?},
      })
    end
  end
end
