require_relative 'spec_helper'
require 'date'

describe MusicAlbum do
  context 'When testing the Music Album Class and its Methods' do
    before :each do
      @title = 'Khawb Saraey'
      @genre = Genre.new('Classical')
      @source = Source.new('Spotify')
      @publish_date = '2002-11-11'
      @my_music_album = MusicAlbum.new(@title, @genre, @source, @publish_date)
    end

    it 'will test that if the music album is older than 10 years, is it archiving that album' do
      expect(@my_music_album.can_be_archived?).to eq true
    end

    it 'will test that if the music album is less than 10 years, it should not archive this album' do
      @my_music_album.publish_date = DateTime.parse('2022-11-11')
      expect(@my_music_album.can_be_archived?).to eq false
    end

    it 'Tests to make sure our test Music Album becomes the correct format in order to store between sessions' do
      actual = { title: 'Khawb Saraey', genre: { name: 'Classical' }, source: { name: 'Spotify' }, publish_date: '2002-11-11' }
      expect(@my_music_album.to_hash).to eq actual
    end
  end
end
