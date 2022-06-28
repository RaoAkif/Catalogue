require 'date'
require './label'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :genre, :author, :source, :label, :id

  def initialize(title, publish_date, archived: false)
    @id = Random.rand(1...100)
    @title = title
    @publish_date = DateTime.parse(publish_date)
    @archived = archived
  end

  def add_genre(genre_name)
    @genre = genre_name
  end

  def add_label(label)
    @label = label
  end

  def add_author(author_name)
    @author = author_name
  end

  def add_source(source_name)
    @source = source_name
  end

  def can_be_archived?
    today = DateTime.now
    age_in_days = today - @publish_date
    age_in_years = age_in_days.to_i / 365.25
    return true if age_in_years >= 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
