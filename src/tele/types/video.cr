require "../type"
require "./photo_size"

module Tele
  module Types
    class Video < Type
      mapping({
        file_id:   {type: String},
        width:     {type: Int32},
        height:    {type: Int32},
        duration:  {type: Int32},
        thumb:     {type: PhotoSize?},
        mime_type: {type: String?},
        file_size: {type: Int32?},
      })
    end
  end
end
