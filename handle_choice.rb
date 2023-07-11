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
