require_relative 'capitalize_decorator' # Assuming the file is in the same directory
require_relative 'base_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double("nameable") }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe "#correct_name" do
    it "calls the correct_name method on the nameable object and capitalizes the result" do
      expect(nameable).to receive(:correct_name).and_return("john")
      expect(decorator.correct_name).to eq("John")
    end
  end
end
