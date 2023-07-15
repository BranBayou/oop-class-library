require_relative '../nameable'

class Nameable
  def correct_name
    raise NotImplementedError, 'Implement correct_name method'
  end
end
RSpec.describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
