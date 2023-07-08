require './app'

def options
  puts ''
  puts 'Please choose an option by entering a number'
  puts '1 - List all books.'
  puts '2 - List all people'
  puts '3 - Create a person.'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit.'
end

def handle_choice(choice, app)
  case choice

  when 3
    app.create_person

  when 4
    app.create_book

  when 5
    app.create_rental

  when 6
    app.rental_list

  when 7
    puts ':) Thank you for using this app!'
    return false

  end
  true
end

def main
  app = App.new
  puts 'Welcome to OOP School Library App!'
  proceed = true

  while proceed
    options
    choice = gets.chomp.to_i
    if choice == 1
      app.book_list
    elsif choice == 2
      app.people_list
    else
      proceed = handle_choice(choice, app)
    end
  end
end

main
