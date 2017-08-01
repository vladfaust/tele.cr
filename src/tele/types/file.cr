module Tele
  module Types
    class File
      JSON.mapping({
        file_id:   {type: String},
        file_size: {type: Int32?},
        file_path: {type: String?},
      })
    end
  end
end
