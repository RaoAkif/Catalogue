require_relative 'item'
require 'date'

class Book < Item
  def initialize(publish_date, publisher, cover_state, author )
    super(publish_date, archived: false)
    @publish_date = DateTime.parse(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    self.add_author(author)
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'
    false
  end
end
