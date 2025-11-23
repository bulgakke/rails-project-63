# frozen_string_literal: true

module HexletCode
  module HTML
    # Module for creating HTML tags
    module Tag
      module_function

      UNPAIRED_TAGS = %w[br hr img input].freeze

      def build(tag_name, attrs = {})
        html_attrs = attrs_to_html(attrs)

        if UNPAIRED_TAGS.include?(tag_name)
          "<#{tag_name}#{html_attrs}/>"
        else
          "<#{tag_name}#{html_attrs}>#{yield}</#{tag_name}>"
        end
      end

      def attrs_to_html(attrs_hash)
        attrs_hash.map { |key, value| " #{key}=\"#{value}\"" }.join
      end
    end
  end
end
