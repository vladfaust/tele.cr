require "../type"

module Tele
  module Types
    class ChatPhoto < Type
      mapping({
        small_file_id: {type: String},
        big_file_id:   {type: String},
      })
    end
  end
end
