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

  def can_be_archived?()
    duration = (Date.today.year - Date.parse(@last_played_at).year)
    super && (duration > 2)
  end
end
