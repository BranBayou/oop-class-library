require_relative './nameable'

class Subclass < Nameable
  def correct_name
    raise NotImplementedError, 'Implement correct_name method'
  end
end

describe Subclass do
  let(:subclass) { Subclass.new }

  describe "#correct_name" do
    it "raises NotImplementedError" do
      expect { subclass.correct_name }.to raise_error(NotImplementedError, 'Implement correct_name method')
    end
  end
end
