module Tele
  module Types
    class PhotoSize
      JSON.mapping({
        file_id:   {type: String},
        width:     {type: Int32},
        height:    {type: Int32},
        file_size: {type: Int32?},
      })
    end
  end
end
