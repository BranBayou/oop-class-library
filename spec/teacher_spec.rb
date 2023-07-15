require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math') }
  describe '#initialize' do
    it 'sets the age, specialization, parent_permission, and name' do
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.name).to eq('Unknown')
    end
  end
  describe '#type' do
    it 'returns the type as "Teacher"' do
      expect(teacher.type).to eq('Teacher')
    end
  end
  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
