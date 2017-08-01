require "./photo_size"
require "./message_entity"
require "./animation"

module Tele
  module Types
    class Game
      JSON.mapping({
        title:         {type: String},
        description:   {type: String},
        photo:         {type: Array(PhotoSize)},
        text:          {type: String?},
        text_entities: {type: Array(MessageEntity)?},
        animation:     {type: Animation?},
      })
    end
  end
end
