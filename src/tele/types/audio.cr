require "../type"

module Tele
  module Types
    struct Audio < Type
      mapping({
        file_id:   {type: String},
        duration:  {type: Int32},
        performer: {type: String?},
        title:     {type: String?},
        mime_type: {type: String?},
        file_size: {type: Int32?},
      })
    end
  end
end
