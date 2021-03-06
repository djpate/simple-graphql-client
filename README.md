# SimpleGraphqlClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/simple_graphql_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_graphql_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_graphql_client

## Usage

### Basic usage

```
client = SimpleGraphqlClient::Client.new(url: 'https://api.spacex.land/graphql')
client.query(gql: %{
query {
  launchesPast(limit: 10) {
    mission_name
    launch_date_local
    launch_site {
      site_name_long
    }
  }
}
})
=> {"launchesPast"=>[{"mission_name"=>"Starlink-15 (v1.0)",....
```

### With custom headers
```
client = SimpleGraphqlClient::Client.new(url: 'https://api.spacex.land/graphql') do 
  {authorization: "bearer foobar"}
  # can be any supported rest_client options
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/simple_graphql_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/simple_graphql_client/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimpleGraphqlClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/simple_graphql_client/blob/master/CODE_OF_CONDUCT.md).
