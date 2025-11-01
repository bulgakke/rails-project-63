# frozen_string_literal: true

module HexletCode
  module FormInputs
    # Label for inputs
    class Label
      def initialize(field_name, _value, attrs = {})
        @value = attrs.delete(:value) || get_human_readable_value(field_name)
        @attrs = { for: field_name }.merge(attrs)
      end

      def to_html
        Tag.build('label', @attrs) { @value }
      end

      private

      def get_human_readable_value(field_name)
        field_name.to_s.capitalize.gsub('_-', ' ')
      end
    end
  end
end
