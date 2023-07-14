require_relative '../book'
require_relative '../rental'
require 'date'

describe Book do
  let(:book) { Book.new("The Great Gatsby", "F. Scott Fitzgerald") }
  let(:date) { Date.new(2023, 7, 14) }
  let(:person) { double("person", to_s: "Person Object", rentals: []) }

  describe "#initialize" do
    it "sets the title and author" do
      expect(book.title).to eq("The Great Gatsby")
      expect(book.author).to eq("F. Scott Fitzgerald")
    end

    it "initializes rentals as an empty array" do
      expect(book.rentals).to eq([])
    end
  end

  describe "#add_rental" do
    it "creates a new Rental object and adds it to the rentals array" do
      rental = book.add_rental(date, person)
      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person.to_s)
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end
end
