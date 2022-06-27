class Main

  def process_selection(selection) # rubocop:disable Metrics/CyclomaticComplexity
    case selection
    when '1'
      puts "option 1 selected"
    when '2'
      puts "option 2 selected"
    when '3'
      puts "option 3 selected"
    when '4'
      puts "option 4 selected"
    when '5'
      puts "option 5 selected"
    when '6'
      puts "option 6 selected"
    when '7'
      puts "option 7 selected"
    when '8'
      puts "option 8 selected"
    when '9' then "Have a nice day"
    else
      puts 'Invalid selection'
    end
  end

  def interface
    selection = nil
    until selection == '9'
      puts "Welcome to Catalog App!\n\n"
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all music albums'
      puts '3 - List all movies'
      puts '4 - List all games'
      puts '5 - Create a book'
      puts '6 - Create a music album'
      puts '7 - Create a movie'
      puts '8 - Create a game'
      puts '9 - Exit'
      selection = gets.chomp.to_s
      process_selection(selection)
    end
    puts "Have a great day!"
  end
end

