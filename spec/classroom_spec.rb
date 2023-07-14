require_relative '../classroom' 

describe Classroom do
  let(:classroom) { Classroom.new("Physics") }
  let(:student) { double("student") }

  describe "#initialize" do
    it "sets the label and initializes students as an empty array" do
      expect(classroom.label).to eq("Physics")
      expect(classroom.students).to eq([])
    end
  end

  describe "#add_student" do
    it "adds a student to the students array and sets the student's classroom to the current classroom" do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
