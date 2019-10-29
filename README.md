# Films

This gem provides a list of the top selling films by year of user's choice or the top selling films of all time according to the Movie Database website (https://www.themoviedb.org). Some of the older movies on the website (anything before 1975) may not have some of the information available or some information may display as 0. Information can be found between the years 1890-2019.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'films'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install films

## Usage

To run this app, you must first require an API key from https://www.themoviedb.org and enter the following commands into your terminal:

 ``` $ export KEY=<your API key>```
 
  ```$ cd highest_grossing_films```
  
  ```$ bundle install```
  
  ```$ bin/films```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'relational-programmer-0293'/highest_grossing_films. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HighestGrossingFilms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'relational-programmer-0293'/highest_grossing_films/blob/master/CODE_OF_CONDUCT.md).
