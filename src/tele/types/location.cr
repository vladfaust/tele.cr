require "../type"

module Tele
  module Types
    struct Location < Type
      mapping({
        longitude: {type: Float64},
        latitude:  {type: Float64},
      })
    end
  end
end
