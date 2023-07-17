# lucky_postgis

Library for using PostGIS types in the Lucky framework and Avram ORM.

## Caution

Currently the only supported type is Point2D.

Arrays of type Point2D are not yet supported.

Other types will be added in the future.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     lucky_postgis:
       github: fujikawahiroaki/lucky_postgis
   ```

2. Run `shards install`

## Usage

```crystal
require "lucky_postgis"
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/lucky_postgis/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [fujikawahiroaki](https://github.com/your-github-user) - creator and maintainer
