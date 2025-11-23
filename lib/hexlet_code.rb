# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Main module
module HexletCode
  autoload(:HTML, 'hexlet_code/html')
  autoload(:Form, 'hexlet_code/form')

  def self.form_for(object, attributes = {}, renderer: HTML::Renderer.new, &)
    Form.new(object, renderer, attributes).tap(&).render
  end
end
