# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode::Form do
  subject(:form_html) { HexletCode::Form.new(user, form_attributes).tap(&block).to_html }

  let(:user) { double(:object, name: 'John', age: 25) }
  let(:form_attributes) { { url: 'http://example.com', method: 'put' } }
  let(:block) do
    proc do |f|
      f.input :name, class: 'user-input'
      f.input :age

      f.submit
    end
  end

  context 'without attributes' do
    let(:form_attributes) { {} }

    it 'creates a form with default attributes' do
      expect(form_html).to eq(
        <<~HTML.lines.map(&:strip).join
          <form action="#" method="post">
            <label for="name">Name</label>
            <input name="name" type="text" value="John" class="user-input"/>
            <label for="age">Age</label>
            <input name="age" type="text" value="25"/>
            <input type="submit" value="Save"/>
          </form>
        HTML
      )
    end
  end

  context 'with attributes' do
    it 'creates a form tag with specified attributes' do
      expect(form_html).to eq(
        <<~HTML.lines.map(&:strip).join
          <form method="put" action="http://example.com">
            <label for="name">Name</label>
            <input name="name" type="text" value="John" class="user-input"/>
            <label for="age">Age</label>
            <input name="age" type="text" value="25"/>
            <input type="submit" value="Save"/>
          </form>
        HTML
      )
    end
  end

  context 'with label attributes' do
    let(:block) do
      proc do |f|
        f.input :name, label_options: { value: 'Имя', class: 'form-label' }
        f.submit
      end
    end

    it 'creates a form tag with specified attributes' do
      expect(form_html).to eq(
        <<~HTML.lines.map(&:strip).join
          <form method="put" action="http://example.com">
            <label for="name" class="form-label">Имя</label>
            <input name="name" type="text" value="John"/>
            <input type="submit" value="Save"/>
          </form>
        HTML
      )
    end
  end

  context 'with text area' do
    let(:block) do
      proc do |f|
        f.input :name, as: :text, class: 'user-input', cols: 30
        f.input :age
        f.submit
      end
    end

    it 'creates a form tag with specified attributes' do
      expect(form_html).to eq(
        <<~HTML.lines.map(&:strip).join
          <form method="put" action="http://example.com">
            <label for="name">Name</label>
            <textarea name="name" cols="30" rows="40" class="user-input">John</textarea>
            <label for="age">Age</label>
            <input name="age" type="text" value="25"/>
            <input type="submit" value="Save"/>
          </form>
        HTML
      )
    end
  end

  context 'with unrecognized input type' do
    let(:block) do
      proc do |f|
        f.input :name, as: :unknown
      end
    end

    it 'raises an error' do
      expect { form_html }.to raise_error(ArgumentError)
    end
  end
end
