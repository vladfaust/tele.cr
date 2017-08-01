require "./photo_size"

module Tele
  module Types
    class Animation
      JSON.mapping({
        file_id:   {type: String},
        thumb:     {type: PhotoSize?},
        file_name: {type: String?},
        mime_type: {type: String?},
        file_size: {type: Int32?},
      })
    end
  end
end
