require "../responders/start"

module Actions
  class Start < Tele::Action
    @name = uninitialized String

    def perform
      @name = "ExampleBot"
      Responders::Start.new(update, @name).respond
    end
  end
end
