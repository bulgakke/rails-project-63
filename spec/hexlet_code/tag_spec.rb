# frozen_string_literal: true

require "spec_helper"

RSpec.describe HexletCode::Tag do
  describe ".build" do
    context "with a block" do
      it "returns a paired HTML tag with block result inside" do
        expect(HexletCode::Tag.build("br") { "content" }).to eq("<br>content</br>")
        expect(HexletCode::Tag.build("br", { a: "b" }) { "content" }).to eq("<br a=\"b\">content</br>")
      end
    end

    context "without a block" do
      it "returns a single HTML tag" do
        expect(HexletCode::Tag.build("br")).to eq("<br/>")
        expect(HexletCode::Tag.build("br", { a: "b" })).to eq("<br a=\"b\"/>")
      end
    end
  end
end
