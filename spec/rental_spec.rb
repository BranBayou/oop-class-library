require_relative '../rental'

RSpec.describe Rental do
  let(:date) { '2022-01-01' }
  let(:book) { double('Book', rentals: []) }
  let(:person) { double('Person', rentals: []) }
  let(:rental) { Rental.new(date, book, person) }
  describe '#initialize' do
    it 'sets the date' do
      expect(rental.date).to eq(date)
    end
    it 'sets the book' do
      expect(rental.book).to eq(book)
    end
    it 'adds the rental to the book rentals array' do
      expect(book.rentals).to include(rental)
    end
    it 'sets the person' do
      expect(rental.person).to eq(person)
    end
    it 'adds the rental to the person rentals array' do
      expect(person.rentals).to include(rental)
    end
  end
end
