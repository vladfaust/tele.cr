require "../request"

module Tele
  module Requests
    class PromoteChatMember < Request(Nil)
      map({
        chat_id:              {type: Int32 | String},
        user_id:              {type: Int32},
        until_date:           {type: Int32?},
        can_change_info:      {type: Bool?},
        can_post_messages:    {type: Bool?},
        can_edit_messages:    {type: Bool?},
        can_delete_messages:  {type: Bool?},
        can_invite_users:     {type: Bool?},
        can_restrict_members: {type: Bool?},
        can_pin_messages:     {type: Bool?},
        can_promote_members:  {type: Bool?},
      })
    end
  end
end
