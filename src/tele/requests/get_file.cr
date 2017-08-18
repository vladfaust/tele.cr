require "../request"

module Tele
  module Requests
    class GetFile < Request(Types::File)
      map({
        file_id: {type: String},
      })
    end
  end
end
