require "../request"
require "../types/user"

module Tele
  module Requests
    class GetMe < Request(Types::User)
    end
  end
end
