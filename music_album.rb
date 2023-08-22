require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, archived: false, on_spotify: true)
    super(id, publish_date, archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super() && @on_spotify
  end
end
