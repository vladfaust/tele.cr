require "./photo_size"

module Tele
  module Types
    class UserProfilePhoto
      JSON.mapping({
        total_count: {type: Int32},
        photos:      {type: Array(Array(PhotoSize))},
      })
    end
  end
end
