module Tele
  module Types
    class ForceReply
      JSON.mapping({
        force_reply: {type: Bool, mustbe: true},
        selective:   {type: Bool?},
      })
    end
  end
end
