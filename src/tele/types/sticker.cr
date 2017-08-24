require "../type"
require "./photo_size"

module Tele
  module Types
    struct Sticker < Type
      mapping({
        file_id:   {type: String},
        width:     {type: Int32},
        height:    {type: Int32},
        thumb:     {type: PhotoSize?},
        emoji:     {type: String?},
        file_size: {type: Int32?},
      })
    end
  end
end
