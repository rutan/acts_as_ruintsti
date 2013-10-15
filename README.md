# acts_as_ruinsti 
acts_as_ruinsti is plugin for Rails 4.
You can use the type of integer in the STI(Single Table Inheritance).

## Usage
```ruby
class Block < ActiveRecord::Base
  acts_as_ruinsti({
    1 => 'RedBlock',
    2 => 'BlueBlock',
  })

  ...
end

class RedBlock < Block
  ...
end

class BlueBlock < Block
  ...
end
```

## License
MIT-LICENSE.
