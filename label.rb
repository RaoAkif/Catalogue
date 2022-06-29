require_relative 'item'

class Label
  attr_reader :id, :items, :title, :color

  def initialize(title, color, items = [])
    @id = Random.rand(1...100)
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end

  def to_hash
    { title: @title, color: @color }
  end
end
