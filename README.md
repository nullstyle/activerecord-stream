# Activerecord::Stream

Enables lazy-ish, Enumerator based traversal of data within ActiveRecord.




## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-stream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-stream

## Usage

```ruby

# get an enumerator
users = User.order("id desc").stream


users.next # => #<User:...>
# The preceding call loads a batch of records
# User Load (330.4ms)  SELECT "users".* FROM "users" ORDER BY id desc LIMIT 500 OFFSET 0
user.next # =>  #<User:...>
# No DB load happens until we exhaust the batch loaded in the previous call

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
