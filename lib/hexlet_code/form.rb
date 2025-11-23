# frozen_string_literal: true

module HexletCode
  # Class for creating and filling HTML forms
  class Form
    def initialize(object, renderer, form_attributes = {})
      @object = object
      @renderer = renderer
      @form_attributes = fill_default_attributes(form_attributes)
      @inputs = []
    end

    def input(field, as: :base, label: :auto, **attrs)
      value = @object.public_send(field)
      # If label is specified, use it
      # If not, build automatically from field name
      # If specified to be nil, don't do anything here; renderer will also not add it
      label = get_human_readable_value(field) if label == :auto
      label_options = attrs.delete(:label_options) || {}
      @inputs << { input_type: as, field:, value:, label:, label_options:, attrs: }
    end

    def submit(value = 'Save', **attrs)
      @inputs << { input_type: :submit, label: nil, value:, attrs: }
    end

    def render
      @renderer.render(@inputs, @form_attributes)
    end

    private

    def fill_default_attributes(attributes)
      url = attributes.delete(:url) || '#'
      default_method = 'post'
      attributes[:action] ||= url
      attributes[:method] ||= default_method
      attributes
    end

    def get_human_readable_value(field_name)
      field_name.to_s.capitalize.gsub('_', ' ')
    end
  end
end
