require "../type"

module Tele
  module Types
    class ForceReply < Type
      mapping({
        force_reply: {type: Bool, mustbe: true},
        selective:   {type: Bool?},
      })
    end
  end
end
