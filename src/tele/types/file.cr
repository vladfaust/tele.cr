require "../type"

module Tele
  module Types
    struct File < Type
      mapping({
        file_id:   {type: String},
        file_size: {type: Int32?},
        file_path: {type: String?},
      })
    end
  end
end
