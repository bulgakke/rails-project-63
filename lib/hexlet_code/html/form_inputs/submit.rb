# frozen_string_literal: true

module HexletCode
  module HTML
    module FormInputs
      # Form input for for submit button
      class Submit
        def initialize(_field_name, value, attrs = {})
          @attrs = { type: 'submit', value: value }.merge(attrs)
        end

        def to_html
          Tag.build('input', @attrs)
        end
      end
    end
  end
end
