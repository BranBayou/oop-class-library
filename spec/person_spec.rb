require_relative '../person'

RSpec.describe Person do
  let(:age) { 20 }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }
  let(:person) { Person.new(age, parent_permission: parent_permission, name: name) }
  describe '#initialize' do
    it 'sets the age' do
      expect(person.age).to eq(age)
    end
    it 'sets the parent_permission' do
      expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
    end
    it 'sets the name' do
      expect(person.name).to eq(name)
    end
    it 'initializes an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end
  # describe '#can_use_services?' do
  #   context 'when person is of age' do
  #     let(:age) { 18 }
  #     it 'returns true' do
  #       expect(person.can_use_services?).to be_truthy
  #     end
  #   end
  #   context 'when person is not of age but has parent permission' do
  #     let(:age) { 16 }
  #     it 'returns true' do
  #       expect(person.can_use_services?).to be_truthy
  #     end
  #   end
  #   context 'when person is not of age and does not have parent permission' do
  #     let(:age) { 16 }
  #     let(:parent_permission) { false }
  #     it 'returns false' do
  #       expect(person.can_use_services?).to be_falsy
  #     end
  #   end
  # end
  describe '#of_age?' do
    context 'when person is of age' do
      let(:age) { 18 }
      it 'returns true' do
        expect(person.of_age?).to be_truthy
      end
    end
    context 'when person is not of age' do
      let(:age) { 16 }
      it 'returns false' do
        expect(person.of_age?).to be_falsy
      end
    end
  end
  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq(name)
    end
  end
  describe '#add_rental' do
    let(:date) { '2022-01-01' }
    let(:other_person) { double('Person') }
    it 'creates a new Rental object' do
      expect(Rental).to receive(:new).with(date, person, other_person)
      person.add_rental(date, other_person)
    end
  end
end
