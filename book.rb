require_relative 'all_paths'

class Book < Item
  def initialize(publisher, cover_state, publish_date, id = nil)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  attr_accessor :@publisher, :@cover_state

  private

  def can_be_archived?()
    super() || @cover_state = 'bad'
  end
end
