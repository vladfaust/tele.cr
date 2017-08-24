require "../type"
require "./chat_photo"

module Tele
  module Types
    struct Chat < Type
      mapping({
        id:                             {type: Int32},
        type:                           {type: String},
        title:                          {type: String?},
        username:                       {type: String?},
        first_name:                     {type: String?},
        last_name:                      {type: String?},
        all_members_are_administrators: {type: Bool?},
        photo:                          {type: ChatPhoto?},
        description:                    {type: String?},
        invite_link:                    {type: String?},
      })
    end
  end
end
