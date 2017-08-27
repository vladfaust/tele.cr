require "../../request"

module Tele
  module Requests
    module UpdatingMessages
      class DeleteMessage < Request(Nil) # TODO: "the edited Message is returned, otherwise True is returned."
        map({
          chat_id:    {type: Int32 | String},
          message_id: {type: Int32},
        })
      end
    end
  end
end
