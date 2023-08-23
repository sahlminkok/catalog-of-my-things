require_relative '../game'

describe Game do
  let(:publish_date) { '2020-01-01' }
  let(:archived) { false }
  let(:multiplayer) { 'yes' }
  let(:last_played_at) { '2023-08-22' }
  let(:game) { Game.new(multiplayer, last_played_at, publish_date, archived: archived) }

  describe 'Initialization' do
    it 'should have attributes set correctly' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.archived).to eq(archived)
      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
    end
  end
end
