require 'item'
require 'date'

class Game < Item
  def initialize(title, author, publish_date, archeived: false, multiplayer: true, last_played_at)
    super(title, publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.parse(last_played_at)
  end


end