require_relative 'spec_helper'
require 'date'

describe Book do
  context 'When testing the book class' do
    before :each do
      @title = 'Game of Thrones'
      @publish_date = '2000-01-01'
      @publisher = 'GoT Publishing'
      @cover_state = 'Good'
      @author = Author.new('George', 'Martin')
      @label = Label.new('Fantasy', 'Purple')
      @book_to_test = Book.new(@title, @publish_date, @publisher, @cover_state, @author, @label)
    end

    it 'Check to see if variable is assigned to an instance of the book class' do
      @book_to_test.should be_an_instance_of Book
    end

    it 'Tests to see if the book can be archived' do
      expect(@book_to_test.can_be_archived?).to eq true
    end

    it 'Tests to see if the book can be archived - but returns false when needed' do
      @book_to_test.publish_date = DateTime.parse('2022-01-01')
      expect(@book_to_test.can_be_archived?).to eq false
    end

    it 'Tests to make sure our test book becomes the correct format in order to store between sessions' do
      actual = { title: 'Game of Thrones', publish_date: '2000-01-01', publisher: 'GoT Publishing', cover_state: 'Good',
                 author: { first_name: 'George', last_name: 'Martin' }, label: { title: 'Fantasy', color: 'Purple' } }
      expect(@book_to_test.to_hash).to eq actual
    end
  end
end
