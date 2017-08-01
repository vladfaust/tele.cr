module Tele
  module Types
    class LabeledPrice
      JSON.mapping({
        label:  {type: String},
        amount: {type: Int32},
      })
    end
  end
end
