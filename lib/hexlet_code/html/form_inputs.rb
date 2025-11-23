# frozen_string_literal: true

module HexletCode
  module HTML
    # Factory for creating form inputs of specific types
    module FormInputs
      autoload(:Base, 'hexlet_code/html/form_inputs/base')
      autoload(:TextArea, 'hexlet_code/html/form_inputs/text_area')
      autoload(:Submit, 'hexlet_code/html/form_inputs/submit')
      autoload(:Label, 'hexlet_code/html/form_inputs/label')

      INPUT_TYPES = {
        base: Base,
        text: TextArea,
        text_area: TextArea,
        submit: Submit,
        label: Label
      }.freeze

      def self.input_class(input_type)
        input_class = INPUT_TYPES[input_type]

        if input_class.nil?
          error_msg = "Unknown input type: #{input_type}. Supported types are: #{INPUT_TYPES.keys}"
          raise ArgumentError, error_msg
        end

        input_class
      end
    end
  end
end
