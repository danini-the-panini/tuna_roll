# TunaRoll

Find all the HTML classes used in your templates. Super-duper experimental, only works on Slim and ERB (although any Temple engine can be adapted), and only find classes statically in the templates themselves.

It works by rendering the template without any Ruby code (so it renders every possible branch) and just extracts all the class attributes. Yeah I know it's really dumb, but anything smarter would be a ridiculous amount of effort.

If it detects any classes with a dynamic portion, it just replaces that portion with the string `%DYNAMIC%`.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add tuna_roll
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install tuna_roll
```

## Usage

```
$ tunarall app/views/**/*.erb
```

Outputs all the classes to stdout. Can take a few seconds if your app is large.

Internally it's just calling `TunaRoll::ClassUnroller.new(path).call` on every file.

###

## Why is it called TunaRoll?

Because it unrolls templates into flat HTML to get all the classes, so template-unroll -> tunroll -> TunaRoll.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danini-the-panini/tuna_roll.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
