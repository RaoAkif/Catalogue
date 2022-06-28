require_relative 'book'

class BookCreator
  def create_book
    puts 'Please type the book title'
    title = gets.chomp
    
    puts 'Please type the author name'
    author = gets.chomp

    puts 'Please enter the publish date as YYYY-MM-DD'
    publish_date = gets.chomp

    puts 'Please enter the publisher name'
    publisher = gets.chomp

    puts 'Please enter the book condition (e.g. bad, good, new)'
    cover_state = gets.chomp

    new_book = Book.new(title, publish_date, publisher, cover_state, author)
  end
end