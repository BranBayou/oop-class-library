require_relative '../base_decorator'
require_relative '../trim_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }
  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'trims the name to 10 characters' do
        allow(nameable).to receive(:correct_name).and_return('John Doe Smith')
        expect(decorator.correct_name).to eq('John Doe S')
      end
    end
    context 'when the name is shorter than or equal to 10 characters' do
      it 'does not trim the name' do
        allow(nameable).to receive(:correct_name).and_return('Jane Smith')
        expect(decorator.correct_name).to eq('Jane Smith')
      end
    end
    context 'when the name is empty' do
      it 'returns an empty string' do
        allow(nameable).to receive(:correct_name).and_return('')
        expect(decorator.correct_name).to eq('')
      end
    end
    context 'when the name contains only whitespace' do
      it 'returns an empty string' do
        allow(nameable).to receive(:correct_name).and_return('    ')
        expect(decorator.correct_name).to eq('')
      end
    end
  end
end
