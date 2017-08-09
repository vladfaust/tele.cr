# Tele

A convenient Telegram Bot framework written in Crystal 💎

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  tele:
    github: vladfaust/tele
    branch: development
```

## Usage

```crystal
require "tele"

class StartResponder < Tele::Responder
  def respond
    first_name = update.message.not_nil!.chat.first_name

    R::SendMessage.new(
      chat_id: update.message.not_nil!.chat.id,
      text: "Hello, <b>#{first_name}</b>!",
      parse_mode: "HTML",
    )
  end
end

class StartAction < Tele::Action
  def perform
    StartResponder.new(update).respond
  end
end

class ExampleBot < Tele::Bot
  @@name = "ExampleBot"

  def map(update)
    if message = update.message
      text = update.message.not_nil!.text
      if text
        case text
        when /^\/start/
          StartAction
        end
      end
    end
  end
end

bot = ExampleBot.new("BOT_TOKEN", 5000, Logger.new(STDOUT))
bot.set_webhook(URI.new(scheme: "https", host: "example.com"))
bot.listen

# => ExampleBot @ webhook set to https://example.com
# => ExampleBot @ listening on port 5000
# => ExampleBot @ incoming text message from user @vladfaust (id 42): "/start"
# => ExampleBot @ handled in 594.0µs
```

See `example/` for a full-featured example implementation.

## Development

I love Crystal because if it compiles it means the program will definitely work. This reduces the amount of tests to be written. I personally write tests for SQL queries only. 😄

So there are no any test for Tele yet. If you feel uncomfortable with it, write some and create a PR.

## Roadmap

- [x] Inline queries
- [x] Sending files
- [ ] HTTP Client pooling
- [ ] Asynchronous requests
- [ ] Broadcasting
- [ ] User state
- [ ] I18n
- [ ] [getUpdates](https://core.telegram.org/bots/api#getupdates)

## Contributing

1. Create an issue
2. Fork it https://github.com/vladfaust/tele/fork
3. Make it `git checkout -b issue-42`
4. Do it `git commit -am "feat: my feature\n\nFixes #42"` (see [Commit Message Conventions](https://gist.github.com/stephenparish/9941e89d80e2bc58a153]))
5. Makes us `git push origin issue-42`
6. Better create a new Pull Request

## Contributors

- [@vladfaust](https://github.com/vladfaust) Vlad Faust - creator, maintainer
