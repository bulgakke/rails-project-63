# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode::Tag do
  describe '.build' do
    context 'with a block' do
      it 'returns a paired HTML tag with block result inside' do
        expect(HexletCode::Tag.build('div') { 'content' }).to eq('<div>content</div>')
        expect(HexletCode::Tag.build('div', { a: 'b' }) { 'content' }).to eq('<div a="b">content</div>')
      end
    end

    context 'without a block' do
      it 'returns a single HTML tag' do
        expect(HexletCode::Tag.build('br')).to eq('<br/>')
        expect(HexletCode::Tag.build('br', { a: 'b' })).to eq('<br a="b"/>')
      end
    end
  end
end
