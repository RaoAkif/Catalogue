require 'json'

class Store
  def store_books(obj)
    File.write('./Data/books_data.json', obj)
  end

  def load_books
    books_file = File.open('./Data/books_data.json')
    file_data = books_file.read
    return [] if file_data == ''
    convert_to_array = JSON.parse(file_data, symbolize_names: true).map{|book| Book.new(book[:title], book[:publish_date], book[:publisher], book[:cover_state], book[:author])}
    # [{"title":"jsadkgjnkdsfng","publish_date":"2022-01-01","cover_state":"okay","author":"dfsnjkgkdjnzngdf"}]
  end
end