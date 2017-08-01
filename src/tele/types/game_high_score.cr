require "./user"

module Tele
  module Types
    class GameHighScore
      JSON.mapping({
        position: {type: Int32},
        user:     {type: User},
        score:    {type: Int32},
      })
    end
  end
end
