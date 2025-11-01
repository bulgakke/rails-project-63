# frozen_string_literal: true

module HexletCode
  module FormInputs
    # Form input for text areas
    class TextArea
      def initialize(field_name, value, attrs = {})
        @value = value
        @attrs = { name: field_name, cols: 20, rows: 40 }.merge(attrs)
      end

      def to_html
        Tag.build('textarea', @attrs) { @value }
      end
    end
  end
end
