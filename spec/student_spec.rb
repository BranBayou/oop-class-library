require_relative '../student'

RSpec.describe Student do
  let(:age) { 16 }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }
  let(:classroom) { double('Classroom', students: []) }
  let(:student) { Student.new(age, classroom, parent_permission: parent_permission, name: name) }

  describe '#play_hooky' do
    it 'returns the correct message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
  describe '#classroom=' do
    it 'sets the classroom' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end
    it 'adds the student to the classroom students array' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end
    it 'does not add the student to the classroom students array if already present' do
      classroom.students << student
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end
  describe '#type' do
    it 'returns the correct type' do
      expect(student.type).to eq('Student')
    end
  end
end
