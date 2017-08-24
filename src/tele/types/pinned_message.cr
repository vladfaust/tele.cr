require "../type"
require "./user"
require "./chat"
require "./reply_to_message"
require "./message_entity"
require "./audio"
require "./document"
require "./photo_size"
require "./sticker"
require "./video"
require "./voice"
require "./video_note"
require "./contact"
require "./location"
require "./venue"
require "./invoice"
require "./successful_payment"

module Tele
  module Types
    struct PinnedMessage < Type
      mapping({
        message_id:              {type: Int32},
        date:                    {type: Int32},
        chat:                    {type: Chat},
        from:                    {type: User?},
        forward_from:            {type: User?},
        forward_from_chat:       {type: Chat?},
        forward_from_message_id: {type: Int32?},
        forward_date:            {type: Int32?},
        reply_to_message:        {type: ReplyToMessage?},
        edit_date:               {type: Int32?},
        text:                    {type: String?},
        entities:                {type: Array(MessageEntity)?},
        audio:                   {type: Audio?},
        document:                {type: Document?},
        photo:                   {type: Array(PhotoSize)?},
        sticker:                 {type: Sticker?},
        video:                   {type: Video?},
        voice:                   {type: Voice?},
        video_note:              {type: VideoNote?},
        caption:                 {type: String?},
        contact:                 {type: Contact?},
        location:                {type: Location?},
        venue:                   {type: Venue?},
        new_chat_members:        {type: Array(User)?},
        left_chat_member:        {type: User?},
        new_chat_title:          {type: String?},
        new_chat_photo:          {type: Array(PhotoSize)?},
        delete_chat_photo:       {type: Bool?},
        group_chat_created:      {type: Bool?},
        supergroup_chat_created: {type: Bool?},
        channel_chat_created:    {type: Bool?},
        migrate_to_chat_id:      {type: Int32?},
        migrate_from_chat_id:    {type: Int32?},
        invoice:                 {type: Invoice?},
        successful_payment:      {type: SuccessfulPayment?},
      })
    end
  end
end
