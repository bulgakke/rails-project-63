# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    let(:object) { "something" }
    let(:attributes) { { a: "b" } }
    let(:block) { proc {} }

    it "calls HexletCode::Form.new" do
      expect(HexletCode).to receive(:form_for).with(object, attributes, &block)
      HexletCode.form_for(object, attributes, &block)
    end
  end
end
