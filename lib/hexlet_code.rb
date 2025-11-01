# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  autoload(:Tag, "hexlet_code/tag")

  def self.form_for(object, attributes = {})
    url = attributes.delete(:url) || "#"
    default_method = "post"
    attributes[:action] ||= url
    attributes[:method] ||= default_method

    HexletCode::Tag.build("form", attributes) {}
  end
end
