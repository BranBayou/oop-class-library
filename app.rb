require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def book_list
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def people_list
    @people.each do |people|
      puts "[#{people.class.name}] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
    end
  end

  def create_person
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice

    when 1
      create_student
      puts 'Person created successfully'

    when 2
      create_teacher
      puts 'Person created successfully'

    else
      puts 'Invalid Input'
    end
  end

  def create_student
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp
    permission = true if %w[Y y].include?(permission_input)
    permission = false if %w[N n].include?(permission_input)
    @people << Student.new(age, nil, parent_permission: permission, name: name)
  end

  def create_teacher
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name: name)
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each.with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by a number (not id): '
    @people.each.with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i

    puts 'Date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully.'
    rental
  end

  def rental_list
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'

    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
