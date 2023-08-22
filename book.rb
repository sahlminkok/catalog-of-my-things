require_relative 'all_paths'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_hash
    super.merge(
      publisher: @publisher,
      cover_state: @cover_state
    )
  end

  def self.new_from_hash(hash)
    super(hash).tap do |book|
      book.publisher = hash[:publisher]
      book.cover_state = hash[:cover_state]
    end
  end

  private

  def can_be_archived?()
    super || @cover_state = 'bad'
  end
end
