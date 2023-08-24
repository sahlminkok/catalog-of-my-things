require 'date'

class Item
  attr_accessor :publish_date, :archived, :genre, :author, :source, :label
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    return if genre.items.include?(self)

    genre.items << self
  end

  def add_author(author)
    @author = author
    return if author.items.include?(self)

    author.items << self
  end

  def add_source(source)
    @source = source
    return if source.items.include?(self)

    source.items << self
  end

  def add_label(label)
    @label = label
    return if label.items.include?(self)

    label.items << self
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      genres: @genre,
      authors: @author,
      sources: @source,
      labels: @label
    }
  end

  def move_to_archived
    @archived = can_be_archived?
  end

  def can_be_archived?
    today = Date.today
    ten_years_ago = Date.new(today.year - 10, today.month, today.day)
    @publish_date < ten_years_ago
  end
end
