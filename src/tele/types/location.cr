module Tele
  module Types
    class Location
      JSON.mapping({
        longitude: {type: Float64},
        latitude:  {type: Float64},
      })
    end
  end
end
