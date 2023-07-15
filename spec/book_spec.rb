require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  describe '#initialize' do
    it 'sets the title, author, and rentals' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.rentals).to eq([])
    end
  end
end
