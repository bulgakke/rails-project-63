# frozen_string_literal: true

module HexletCode
  module HTML
    module FormInputs
      # Label for inputs
      class Label
        def initialize(field_name, label, attrs = {})
          @value = label
          @attrs = { for: field_name }.merge(attrs)
        end

        def to_html
          Tag.build('label', @attrs) { @value }
        end
      end
    end
  end
end
