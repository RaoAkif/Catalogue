require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title

  def initialize(title, publish_date, last_played_at, multiplayer: true)
    super(title, publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at)
  end

  def can_be_archived?
    today = DateTime.now
    age_in_days = today - @last_played_at
    age_in_years = age_in_days.to_i / 365.25
    return true if super && age_in_years > 2

    false
  end

  def to_hash
    { title: @title, publish_date: @publish_date.strftime('%Y-%m-%d'), last_played_at: @last_played_at.strftime('%Y-%m-%d'), multiplayer: @multiplayer }
  end
end
