require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, _classroom, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
