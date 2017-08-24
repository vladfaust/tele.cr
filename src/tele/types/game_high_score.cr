require "../type"
require "./user"

module Tele
  module Types
    struct GameHighScore < Type
      mapping({
        position: {type: Int32},
        user:     {type: User},
        score:    {type: Int32},
      })
    end
  end
end
