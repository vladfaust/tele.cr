require "json"
require "./types/macros"

module Tele
  abstract class Type
    include Types::Macros
  end
end
