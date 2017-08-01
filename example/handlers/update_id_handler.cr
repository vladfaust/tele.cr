require "../../src/tele/types/update"
require "http/server/handler"

class UpdateIdHandler
  include HTTP::Handler

  private getter logger

  def initialize(@logger : Logger)
  end

  def call(context)
    tmp_body = IO::Memory.new
    IO.copy(context.request.body.not_nil!, tmp_body)
    update = Tele::Types::Update.from_json(tmp_body.to_s)
    logger.info("Incoming update with ID " + update.update_id.to_s)

    call_next(context) if self.next
  end
end
