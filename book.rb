class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  lambda do |date, person|
    Rental.new(date, self, person)
  end
end
