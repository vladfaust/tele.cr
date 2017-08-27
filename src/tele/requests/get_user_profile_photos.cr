require "../request"
require "../types/user_profile_photos"

module Tele
  module Requests
    class GetUserProfilePhotos < Request(Types::UserProfilePhotos)
      map({
        user_id: {type: Int32},
        offset:  {type: Int32?},
        limit:   {type: Int32?},
      })
    end
  end
end
