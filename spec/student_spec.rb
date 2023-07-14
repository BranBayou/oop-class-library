require_relative '../student'
require_relative './classroom'

describe Student do
  let(:classroom) { Classroom.new("Physics") }
  let(:student) { Student.new(16, classroom) }

  describe "#initialize" do
    it "sets the age, classroom, parent_permission, and name attributes" do
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
      expect(student.name).to eq('Unknown')
    end
  end

  describe "#initialize" do
    let(:custom_classroom) { Classroom.new("Chemistry") }
    let(:custom_student) { Student.new(15, custom_classroom, parent_permission: false, name: 'John Doe') }

    it "sets the age, classroom, parent_permission, and name attributes" do
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
      expect(student.name).to eq('Unknown')
    end

    it "allows custom classroom, parent_permission, and name values to be set" do
      expect(custom_student.classroom).to eq(custom_classroom)
      expect(custom_student.instance_variable_get(:@parent_permission)).to eq(false)
      expect(custom_student.name).to eq('John Doe')
    end
  end

  describe "#play_hooky" do
    it "returns the string '¯\\(ツ)/¯'" do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe "#classroom=" do
    it "sets the classroom attribute and adds the student to the classroom" do
      new_classroom = Classroom.new("Math")
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it "does not add the student to the classroom if already present" do
      student.classroom = classroom
      expect(student.classroom.students.count(student)).to eq(1)
    end
  end

  describe "#type" do
    it "returns the string 'Student'" do
      expect(student.type).to eq('Student')
    end
  end
end
