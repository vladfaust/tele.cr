# Tele

A convenient Telegram Bot framework written in Crystal 💎

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  tele:
    github: vladfaust/tele
    version: 0.1.0
```

## Usage

```crystal
require "tele"

class Start < Tele::Handlers::Message
  def call
    send_message(
      text: "Hello, <b>#{message.from.not_nil!.first_name}</b>!",
      parse_mode: "HTML",
    )
  end
end

class ExampleBot < Tele::Bot
  @@name = "ExampleBot"

  def handle(update)
    if message = update.message
      Start
    end
  end
end

bot = ExampleBot.new("BOT_API_TOKEN", 5000, Logger.new(STDOUT))
bot.set_webhook(URI.new(scheme: "https", host: "example.com"))
bot.listen

# => ExampleBot @ using Tele v0.1.0 by @vladfaust
# => ExampleBot @ webhook set to https://example.com
# => ExampleBot @ listening on port 5000
# => ExampleBot @ incoming text message from user @vladfaust (id 42): "/start"
# => ExampleBot @ handled in 594.0µs
```

See `example/` for a full-featured example implementation.

## Development

I love Crystal because if it compiles it means the program will definitely work. This reduces the amount of tests to be written. I personally write tests for SQL queries only. 😄

So there are no any tests for Tele at the moment.

## Roadmap

- [x] Inline queries
- [x] Sending files
- [x] Downloading files
- [x] Multiple requests in one handler
- [ ] HTTP Client pooling
- [ ] Asynchronous requests
- [ ] Broadcasting
- [ ] User state
- [ ] I18n
- [ ] [getUpdates](https://core.telegram.org/bots/api#getupdates)

## Projects using Tele

- [soundmemesbot](https://github.com/vladfaust/soundmemes.cr)

## Contributing

1. Create an issue
2. Fork it https://github.com/vladfaust/tele/fork
3. Make it `git checkout -b issue-42`
4. Do it `git commit -am "feat: my feature\n\nFixes #42"` (see [Commit Message Conventions](https://gist.github.com/stephenparish/9941e89d80e2bc58a153)*)
5. Makes us `git push origin issue-42`
6. Better create a new Pull Request

\* Please use these types: `feat` for new features, `fix` for bugfixes, `ref` for code refactoring, `doc` for documentation improvements, `typo` for fixing typos. Refer to [this commit](https://github.com/vladfaust/tele.cr/commit/5eecab0b9e71282c403c6753ac3064581afd9009) for a good example.

## Contributors

- [@vladfaust](https://github.com/vladfaust) Vlad Faust - creator, maintainer
