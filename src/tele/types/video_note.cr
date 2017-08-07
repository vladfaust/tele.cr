require "../type"
require "./photo_size"

module Tele
  module Types
    class VideoNote < Type
      mapping({
        file_id:   {type: String},
        length:    {type: Int32},
        duration:  {type: Int32},
        thumb:     {type: PhotoSize?},
        file_size: {type: Int32?},
      })
    end
  end
end
