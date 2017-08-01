module Tele
  module Types
    class Audio
      JSON.mapping({
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
