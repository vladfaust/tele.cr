module Tele
  module Types
    class Voice
      JSON.mapping({
        file_id:   {type: String},
        duration:  {type: Int32},
        mime_type: {type: String?},
        file_size: {type: Int32?},
      })
    end
  end
end
