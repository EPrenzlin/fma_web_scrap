# FMA_CLI_Project

This is a CLI dedicated to providing information on State Alchemsits within the Full Metal Alchemist universe.

## CLI Instructions

This is a CLI dedicated to the State Alchemsits within the Full Metal Alchemist universe. Instructions contained within this CLI are as follows : 
1) Enter a number between 1 - 14 to select the relevant alchemist. If the input is valid, it will display basic information such as name, title, rank. 
2) After displaying the basic information, the user will have the choice of reading a character and chapter summary. 
3) Once read, the user will be taken back to the home page for further selection.

## Requirements 

You will need to install the below Ruby gems. 

```ruby
gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"
gem 'nokogiri'
gem 'pry' 
gem 'colorize'
```

And then execute:

    bundle install

## Environment
Within the environment file, the following will need to be required: 
``` 
require "pry"
require "open-uri"
require "nokogiri"
require "colorize"
``` 


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/erik_project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/erik_project/blob/master/CODE_OF_CONDUCT.md).

## Author 
Erik Prenzlin 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ErikProject project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/erik_project/blob/master/CODE_OF_CONDUCT.md).
