require 'json'

class Store
  def store_books(obj)
    File.write('./Data/books_data.json', obj)
  end

  def load_books
    books_file = File.open('./Data/books_data.json')
    file_data = books_file.read
    return [] if file_data == ''

    JSON.parse(file_data, symbolize_names: true).map do |book|
      Book.new(book[:title], book[:publish_date], book[:publisher], book[:cover_state], book[:author])
    end
  end
end
