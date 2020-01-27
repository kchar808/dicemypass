# Dicemypass
```
______   ___   _______  _______  __   __  __   __  _______  _______  _______  _______ 
|      | |   | |       ||       ||  |_|  ||  | |  ||       ||   _   ||       ||       |
|  _    ||   | |       ||    ___||       ||  |_|  ||    _  ||  |_|  ||  _____||  _____|
| | |   ||   | |       ||   |___ |       ||       ||   |_| ||       || |_____ | |_____ 
| |_|   ||   | |      _||    ___||       ||_     _||    ___||       ||_____  ||_____  |
|       ||   | |     |_ |   |___ | ||_|| |  |   |  |   |    |   _   | _____| | _____| |
|______| |___| |_______||_______||_|   |_|  |___|  |___|    |__| |__||_______||_______|
```
A simple passphrase generator that gives you a passphrase of the desired length using EFF's long wordlist.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dicemypass'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dicemypass

## Usage

You can use it as a library in your code.

``` ruby
irb(main):001:0> require 'dmp'
=> true
irb(main):002:0> Dmp.gen_passphrase(4)
=> ["discount", "stove", "rubbing", "underage"]
```

Generate a passphrase

```
$ bundle exec dicemypass gen
- Passphrase: sank universal detract plus sufferer backpedal caucasian
```

or 

```
$ bundle exec dicemypass gen 3
- Passphrase: hemstitch hacksaw wrist
```

Generate passphrase and copy to clipboard and checks if password appears in HIBP datasets

```
$ bundle exec dmp gen 3 -c -H
- Passphrase: imaginary mummify unsaddle
- Copied to clipboard.
- Password was not found in a dataset.
```

Check a password of yours

```
$ bundle exec dicemypass check
Enter your password, press ENTER when you're done.
Password (hidden): ******
Your password appears in 1581 datasets!
```





## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dicemypass.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
