require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math') }

  describe "#initialize" do
    it "sets the age, specialization, parent_permission, and name attributes" do
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(true)
      expect(teacher.name).to eq('Unknown')
    end

    it "allows custom specialization, parent_permission, and name values to be set" do
      teacher = Teacher.new(40, 'English', parent_permission: false, name: 'John Doe')
      expect(teacher.specialization).to eq('English')
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(false)
      expect(teacher.name).to eq('John Doe')
    end
  end

  describe "#type" do
    it "returns the string 'Teacher'" do
      expect(teacher.type).to eq('Teacher')
    end
  end

  describe "#can_use_services?" do
    it "returns true" do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
