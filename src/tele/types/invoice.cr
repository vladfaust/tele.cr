require "../type"

module Tele
  module Types
    class Invoice < Type
      mapping({
        title:           {type: String},
        description:     {type: String},
        start_parameter: {type: String},
        currency:        {type: String},
        total_amount:    {type: Int32},
      })
    end
  end
end
