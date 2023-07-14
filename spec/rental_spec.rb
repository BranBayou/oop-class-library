require '../rental'
require 'date'

describe Rental do
  let(:date) { Date.new(2023, 7, 14) }
  let(:book) { double("book", rentals: []) }
  let(:person) { double("person", rentals: []) }
  let(:rental) { Rental.new(date, book, person) }

  describe "#initialize" do
    it "sets the date, book, and person attributes" do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it "adds the rental to the rentals array of the book and person" do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
