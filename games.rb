require 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer: true last_played_at

  def initialize(title, author, publish_date, archeived: false, multiplayer: true, last_played_at)
    super(title, publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at)
  end

  def can_be_archived?
    return true if super && @last_played_at > '2years'

    false
  end

  def to_hash
    { title: @title, @arthor: arthor publish_date: @publish_date.strftime('%Y-%m-%d'), multiplayer: true, @last_played_at }
  end

end