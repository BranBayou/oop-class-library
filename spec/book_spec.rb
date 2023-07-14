require_relative 'book' # Assuming the file is in the same directory
require_relative 'rental'

describe Book do
  let(:book) { Book.new("The Great Gatsby", "F. Scott Fitzgerald") }
  let(:date) { Date.new(2023, 7, 14) }
  let(:person) { double("person") }

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
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end
end
