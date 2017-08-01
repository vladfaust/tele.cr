module Tele
  module Types
    class ResponseParameters
      JSON.mapping({
        migrate_to_chat_id: {type: Int32?},
        retry_after:        {type: Int32?},
      })
    end
  end
end
