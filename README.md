# jetbrains

Installs Jetbrains Products with chef. Currently supports Linux

# Requirements

* `ark` cookbook

# Usage

## Install some JetBrains IDEs

Include this recipe in a wrapper cookbook:

```
depends 'jetbrains', '~> 1.0'
```

and then do something like this (names are case sensitive)

```ruby
# PhpStorm
jetbrains_product 'PhpStorm' do
  version '9.0.2'
end

# RubyMine
jetbrains_product 'RubyMine' do
  version '7.1.4'
end

# IntelliJ IDEA Ultimate
jetbrains_product 'ideaIU' do
  version '14.1.4'
end

# IntelliJ IDEA Community
jetbrains_product 'ideaIC' do
  version '14.1.4'
end

# Pycharm  Professional
jetbrains_product 'pycharm-professional' do
  version '4.5.4'
end

# Pycharm Community
jetbrains_product 'pycharm-community' do
  version '4.5.4'
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests with `kitchen test`, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author:: Eddie Hurtig (eddie@hurtigtechnologies.com)
