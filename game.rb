require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_hash
    super.merge(
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    )
  end

  def can_be_archived?
    today = Date.today
    two_years_ago = Date.new(today.year - 2, today.month, today.day)
    last_played_date = Date.parse(@last_played_at)
    last_played_date < two_years_ago
  end
end
