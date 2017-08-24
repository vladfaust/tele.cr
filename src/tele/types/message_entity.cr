require "../type"
require "./user"

module Tele
  module Types
    struct MessageEntity < Type
      mapping({
        type:   {type: String},
        offset: {type: Int32},
        length: {type: Int32},
        url:    {type: String?},
        user:   {type: User?},
      })
    end
  end
end
