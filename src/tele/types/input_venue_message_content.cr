require "./input_message_content"

module Tele
  module Types
    class InputVenueMessageContent < InputMessageContent
      JSON.mapping({
        latitude:     {type: Float64},
        longitude:    {type: Float64},
        title:        {type: String},
        address:      {type: String},
        forsquare_id: {type: String},
      })
    end
  end
end
