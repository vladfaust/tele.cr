module Tele
  module Types
    class ChatPhoto
      JSON.mapping({
        small_file_id: {type: String},
        big_file_id:   {type: String},
      })
    end
  end
end
