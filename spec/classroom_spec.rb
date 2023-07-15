require_relative '../classroom'

RSpec.describe Classroom do
  let(:label) { 'Mathematics' }
  let(:classroom) { Classroom.new(label) }
  let(:student) { double('Student') }
  before do
    allow(student).to receive(:classroom=)
  end
  describe '#add_student' do
    it 'adds the student to the students array' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
    it 'sets the classroom of the student' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
    end
  end
end
