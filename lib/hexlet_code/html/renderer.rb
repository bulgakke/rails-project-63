# frozen_string_literal: false

module HexletCode
  module HTML
    class Renderer
      def render(input_hashes, attributes)
        @result_html = ''

        input_hashes.each do |input_hash|
          build_labeled_input!(input_hash)
        end

        Tag.build('form', attributes) do
          @result_html
        end
      end

      private

      def build_labeled_input!(input_hash)
        if input_hash[:label]
          label = FormInputs.input_class(:label).new(
            input_hash[:field], input_hash[:label], input_hash[:label_options]
          )
          @result_html << label.to_html
        end

        input_class = FormInputs.input_class(input_hash[:input_type])
        input = input_class.new(input_hash[:field], input_hash[:value], input_hash[:attrs])

        @result_html << input.to_html
      end
    end
  end
end
