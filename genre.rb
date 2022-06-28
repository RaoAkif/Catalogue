class Genre
  attr_accessor :items

  def initialize(name)
    @id = Random.rand(1...100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end
end

