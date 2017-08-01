module Tele
  module Types
    class Invoice
      JSON.mapping({
        title:           {type: String},
        description:     {type: String},
        start_parameter: {type: String},
        currency:        {type: String},
        total_amount:    {type: Int32},
      })
    end
  end
end
