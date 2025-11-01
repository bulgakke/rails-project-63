# frozen_string_literal: true

module HexletCode
  # Class for creating and filling HTML forms
  class Form
    def initialize(object, attributes = {})
      @object = object
      @attributes = fill_default_attributes(attributes)
      @inputs = []
    end

    def input(field, as: :base, **attrs)
      value = @object.public_send(field)
      label_options = attrs.delete(:label_options) || {}
      @inputs << FormInputs.build(:label, field, nil, label_options)
      @inputs << FormInputs.build(as, field, value, attrs)
    end

    def submit(value = "Save", **attrs)
      @inputs << FormInputs.build(:submit, nil, value, attrs)
    end

    def fill_default_attributes(attributes)
      url = attributes.delete(:url) || "#"
      default_method = "post"
      attributes[:action] ||= url
      attributes[:method] ||= default_method
      attributes
    end

    def to_html
      form_body = @inputs.map(&:to_html).join

      Tag.build("form", @attributes) do
        form_body
      end
    end
  end
end
