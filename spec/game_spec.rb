require_relative 'spec_helper'
require 'date'

describe Game do
  context 'When testing the game class' do
    before :each do
      @title = 'The Croods'
      @publish_date = '2000-01-01'
      @last_played_at = '2010-06-27'
      @game_to_test = Game.new(@title, @publish_date, @last_played_at)
    end

    it 'Check to see if variable is assigned to an instance of the game class' do
      @game_to_test.should be_an_instance_of Game
    end

    it 'Tests to see if the game can be archived' do
      expect(@game_to_test.can_be_archived?).to eq true
    end

    it 'Tests to see if the game can be archived - but returns false when needed' do
      @game_to_test.publish_date = DateTime.parse('2022-01-01')
      expect(@game_to_test.can_be_archived?).to eq false
    end

    it 'Tests to make sure our test game becomes the correct format in order to store between sessions' do
      actual = { title: 'The Croods', publish_date: '2000-01-01', last_played_at: '2010-06-27', multiplayer: true }
      expect(@game_to_test.to_hash).to eq actual
    end
  end
end
