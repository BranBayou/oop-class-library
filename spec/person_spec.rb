require_relative '../person' 
require_relative '../rental'
require 'date'

describe Person do
  let(:person) { Person.new(20) }
  let(:date) { Date.new(2023, 7, 14) }
  let(:other_person) { double("person") }

  describe "#initialize" do
    it "sets the age, name, parent_permission, id, and initializes rentals as an empty array" do
      expect(person.age).to eq(20)
      expect(person.name).to eq('Unknown')
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
      expect(person.instance_variable_get(:@id)).to be_a(Integer)
      expect(person.rentals).to eq([])
    end

    it "allows custom name and parent_permission values to be set" do
      person = Person.new(15, parent_permission: false, name: 'John Doe')
      expect(person.name).to eq('John Doe')
      expect(person.instance_variable_get(:@parent_permission)).to eq(false)
    end
  end

  describe "#can_use_services?" do
    it "returns true if the person is of age" do
      expect(person.can_use_services?).to eq(true)
    end

    it "returns true if the person has parent permission" do
      person = Person.new(15, parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end

    it "returns false if the person is not of age and doesn't have parent permission" do
      person = Person.new(15, parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe "#correct_name" do
    it "returns the name of the person" do
      expect(person.correct_name).to eq('Unknown')
    end
  end

  describe "#add_rental" do
  let(:person) { Person.new(25) }
  let(:date) { Date.new(2023, 7, 14) }
  let(:other_person) { Person.new(30) }
  
   it "creates a new Rental object and returns it" do
    rental = person.add_rental(date, other_person)
    expect(rental).to be_a(Rental)
    expect(rental.date).to eq(date)
    expect(rental.person).to eq(person)
    expect(rental.other_person).to eq(other_person)
     expect(rental.person.age).to eq(person.age)
    expect(rental.person.id).to eq(person.id)
    expect(rental.person.name).to eq(person.name)
    expect(rental.person.parent_permission).to eq(person.parent_permission)
    expect(rental.person.rentals).to eq(person.rentals)
  end
end

  describe "private method #generate_id" do
    it "returns a random integer between 1000 and 9999" do
      id = person.send(:generate_id)
      expect(id).to be_a(Integer)
      expect(id).to be >= 1000
      expect(id).to be <= 9999
    end
  end
end
