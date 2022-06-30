require_relative 'spec_helper'
require 'date'

describe Movie do
  context 'When testing the Movie Class and its Methods' do
    before :each do
      @title = 'Spiderman'
      @genre = Genre.new('Fiction')
      @source = Source.new('Disney Plus')
      @publish_date = '2010-01-01'
      @my_movie = Movie.new(@title, @genre, @source, @publish_date)
    end

    it 'will test that if the Movie is older than 10 years, is it archiving that album' do
      expect(@my_movie.can_be_archived?).to eq true
    end

    it 'will test that if the Movie is less than 10 years, it should not archive this album' do
      @my_movie.publish_date = DateTime.parse('2022-11-11')
      expect(@my_movie.can_be_archived?).to eq false
    end

    it 'Tests to make sure our test Movie becomes the correct format in order to store between sessions' do
      actual = { title: 'Spiderman', genre: { name: 'Fiction' }, source: { name: 'Disney Plus' }, publish_date: '2010-01-01' }
      expect(@my_movie.to_hash).to eq actual
    end
  end
end
