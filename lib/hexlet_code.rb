# frozen_string_literal: true

require_relative "hexlet_code/version"

# Main module
module HexletCode
  autoload(:Tag, "hexlet_code/tag")
  autoload(:Form, "hexlet_code/form")
  autoload(:FormInputs, "hexlet_code/form_inputs")

  def self.form_for(object, attributes = {}, &block)
    Form.new(object, attributes).tap(&block).to_html
  end
end
