# frozen_string_literal: true

module HexletCode
  # Factory for creating form inputs of specific types
  module FormInputs
    autoload(:Base, "hexlet_code/form_inputs/base")

    INPUT_TYPES = {
      base: Base
    }.freeze

    def self.build(input_type, field_name, value, attrs = {})
      INPUT_TYPES[input_type].new(field_name, value, attrs)
    end
  end
end
