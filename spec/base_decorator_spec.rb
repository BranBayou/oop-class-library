require_relative '../base_decorator'

describe Decorator do
  let(:nameable) { double("nameable") }
  let(:decorator) { Decorator.new(nameable) }

  describe "#initialize" do
    it "sets the nameable instance variable" do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe "#correct_name" do
    it "calls the correct_name method on the nameable object" do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
