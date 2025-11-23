# frozen_string_literal: true

module HexletCode
  module HTML
    module FormInputs
      # Base form input without specified type
      class Base
        def initialize(field_name, value, attrs = {})
          label_attrs = attrs.delete(:label_options) || {}
          @label = Label.new(field_name, label_attrs)
          @attrs = { name: field_name, type: 'text', value: value }.merge(attrs)
        end

        def to_html
          Tag.build('input', @attrs)
        end
      end
    end
  end
end
