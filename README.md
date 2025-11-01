### Hexlet tests and linter status:
[![Actions Status](https://github.com/bulgakke/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/bulgakke/rails-project-63/actions)

# HexletCode

Gem for generating HTML forms with Ruby code

## Usage

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user, url: "http://example.com", class: "form" do |f|
  f.input :name
  f.input :job, as: :text
end

# => <form class=\"form\" action=\"http://example.com\" method=\"post\"><input name=\"name\" type=\"text\" value=\"rob\"/><textarea name=\"job\" cols=\"20\" rows=\"40\">hexlet</textarea></form>

```
