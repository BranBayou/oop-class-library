require_relative '../base_decorator'
require_relative '../trim_decorator'

describe TrimmerDecorator do
  let(:nameable) { double("nameable") }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe "#correct_name" do
    it "strips leading and trailing whitespace from the name" do
      allow(nameable).to receive(:correct_name).and_return("  John Doe  ")
      expect(decorator.correct_name).to eq("John Doe")
    end

    it "truncates the name to a maximum of 10 characters" do
      allow(nameable).to receive(:correct_name).and_return("John Doe Smith")
      expect(decorator.correct_name).to eq("John Doe S")
    end
  end
end
