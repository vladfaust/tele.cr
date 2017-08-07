require "../type"

module Tele
  module Types
    class User < Type
      mapping({
        id:            {type: Int32},
        first_name:    {type: String},
        last_name:     {type: String?},
        username:      {type: String?},
        language_code: {type: String?},
      })
    end
  end
end
