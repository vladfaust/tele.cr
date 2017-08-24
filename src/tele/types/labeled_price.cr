require "../type"

module Tele
  module Types
    struct LabeledPrice < Type
      mapping({
        label:  {type: String},
        amount: {type: Int32},
      })
    end
  end
end
