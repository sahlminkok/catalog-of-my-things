class Genre
  attr_accessor :id, :name, :item

  def initialize(name, id: Random.rand(1...1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genres << self
  end
end
