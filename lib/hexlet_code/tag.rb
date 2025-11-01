module HexletCode
  module Tag
    module_function

    def build(tag_name, attrs = {})
      html_attrs = attrs_to_html(attrs)

      if block_given?
        "<#{tag_name}#{html_attrs}>#{yield}</#{tag_name}>"
      else
        "<#{tag_name}#{html_attrs}/>"
      end
    end

    def attrs_to_html(attrs_hash)
      return nil if attrs_hash.empty?

      attrs = attrs_hash.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      " #{attrs}"
    end
  end
end
