# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    subject { HexletCode.form_for(object, attributes) }

    let(:object) { "something" }

    context "without attributes" do
      it "returns a form tag with default attributes" do
        expect(HexletCode.form_for("something")).to eq("<form action=\"#\" method=\"post\"></form>")
      end
    end

    context "with attributes" do
      let(:attributes) { { action: "http://example.com", method: "put" } }

      it "returns a form tag with specified attributes" do
        expect(subject).to eq("<form action=\"http://example.com\" method=\"put\"></form>")
      end
    end
  end
end
