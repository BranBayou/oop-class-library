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
