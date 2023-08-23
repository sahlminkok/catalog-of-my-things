require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genres, :authors, :sources, :labels

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
    @genres = []
    @authors = []
    @sources = []
    @labels = []
  end

  def add_genre(genre)
    @genres << genre
  end

  def add_author(author)
    @authors << author
  end

  def add_source(source)
    @sources << source
  end

  def add_label(label)
    @labels << label
  end

  def move_to_archived
    @archived = can_be_archived?
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      genres: @genres,
      authors: @authors,
      sources: @sources,
      labels: @labels
    }
  end

  private

  def can_be_archived?
    years_difference = (Date.today.year - Date.parse(@publish_date).year)
    years_difference > 10
  end
end
