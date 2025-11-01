### Hexlet tests and linter status:
[![Actions Status](https://github.com/bulgakke/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/bulgakke/rails-project-63/actions)

# HexletCode

Gem for generating HTML forms with Ruby code

## Usage
With defaults:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end
```
will generate:
```html
<!-- actual return value will be in one line, multiline view for demonstration here and onward: -->
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob"/>

  <label for="job">Job</label>
  <input name="job" type="text" value="hexlet"/>

  <input type="submit" value="Save"/>
</form>
```

Customized:

```ruby
HexletCode.form_for user, url: "http://example.com", class: "form" do |f|
  f.input :name
  f.input :job, as: :text
  f.submit "Send", class: "form-submit-button"
end
```

will generate:

```html
<form class="form" action="http://example.com" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob"/>

  <label for="job">Job</label>
  <textarea name="job" cols="20" rows="40">hexlet</textarea>

  <input type="submit" value="Send" class="form-submit-button"/>
</form>
```
