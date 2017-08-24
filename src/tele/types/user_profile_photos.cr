require "../type"
require "./photo_size"

module Tele
  module Types
    struct UserProfilePhoto < Type
      mapping({
        total_count: {type: Int32},
        photos:      {type: Array(Array(PhotoSize))},
      })
    end
  end
end
