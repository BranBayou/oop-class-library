require 'json'
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
    @people_data = nil
    @books_data = nil
    @rentals_data = nil
  end

  def run
    files
    read_data
    read_rentals
  end  

  def files
    @books_data = File.read('./data/book.json')
    @people_data = File.read('./data/people.json')
    @rentals_data = File.read('./data/rentals.json')
  end

  def read_data
    unless @books_data.empty?
      books_array = JSON.parse(@books_data)
      books_array.each do |book|
        @books.push(Book.new(book['Title'], book['Author']))
      end
    end
  
    return if @people_data.empty?
  
    people_array = JSON.parse(@people_data)
    people_array.each do |person|
      if person['type'] == 'Student'
        @people.push(Student.new(person['age'], person['name']))
      else
        @people.push(Teacher.new(person['age'], person['specialization'], person['name']))
      end
    end
  end
  

  def read_rentals
    if @rentals_data.empty? || @people_data.empty? || @books_data.empty?
      puts 'Rentals are empty'
    else
      rentals_array = JSON.parse(@rentals_data)
      rentals_array.each do |rental|
        selecting_book = @books.select { |book| book.title == rental['Book'] }
        selecting_people = @people.select { |person| person.name == rental['Person'] }
  
        if selecting_book.empty?
          puts "Book not found: #{rental['Book']}"
          next
        end
  
        if selecting_people.empty?
          puts ""
          next
        end
  
        @rentals.push(Rental.new(rental['Date'], selecting_people[0], selecting_book[0]))
      end
    end
  end
  

  def save_data
    book_json = []
    people_json = []
    rentals_json = []

    @books.each do |book|
      book_json.push({ Title: book.title, Author: book.author })
    end

    @people.each do |person|
      if person.type == 'Student'
        people_json.push({ type: person.type, name: person.name, age: person.age,
                            parent_permission: person.parent_permission })
      else
        people_json.push({ type: person.type, name: person.name, age: person.age,
                            parent_permission: person.parent_permission, specialization: person.specialization })
      end
    end

    @rentals.each do |rental|
      rentals_json.push({ Date: rental.date, Person: rental.person.name, Book: rental.book.title })
    end

    File.write('./data/book.json', JSON.generate(book_json))

    File.write('./data/people.json', JSON.generate(people_json))

    File.write('./data/rentals.json', JSON.generate(rentals_json))
  end

  def book_list
    if @books.empty?
      puts 'Sorry, there is no book in the Collection'
    else
      @books.each_with_index do |book, index|
        puts "#{index}- Title: '#{book.title}', Author: #{book.author}"
      end
    end
  end

  def people_list
    if @people.empty?
      puts 'Sorry, there is no person in the Database'
    else
      @people.each_with_index do |person, index|
        puts "#{index} [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
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
