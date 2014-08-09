# GenSid

Generate sequential alphanumeric identifiers from a template

e.g. Template 'AA9' produces 'AA0', 'AA1','AA2,'AA3', 'AA4', 'AA5', 'AA6', 'AA7', 'AA8', 'AA9', 'AB0', 'AB1', ....

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gen_sid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gen_sid

## Usage

    require 'gen_sid'
    seq = GenSid::SeqID.new('EF27Y')
    # Note that the first 'next_value' call returns the initial value
    seq.next_value # => "EF27Y"
    seq.next_value # => "EF27Z"
    seq.next_value # => "EF28A"


## Contributing

1. Fork it ( https://github.com/tflynn/gen_sid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
