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

  describe 'to_hash' do
    it 'should return a hash with game attributes' do
      hash = game.to_hash
      expect(hash).to be_a(Hash)
      expect(hash[:publish_date]).to eq(publish_date)
      expect(hash[:archived]).to eq(archived)
      expect(hash[:multiplayer]).to eq(multiplayer)
      expect(hash[:last_played_at]).to eq(last_played_at)
    end
  end

  describe 'can_be_archived?' do
    context 'when last played more than 2 years ago' do
      it 'should return true if super method returns true' do
        today = Date.parse('2023-01-01')
        allow(Date).to receive(:today).and_return(today)
        game.last_played_at = '2020-01-01'
        expect(game.can_be_archived?).to be_falsey
      end

      it 'should return false if super method returns false' do
        today = Date.new(2020, 1, 1)
        allow(Date).to receive(:today).and_return(today)
        expect(game.can_be_archived?).to be_falsey
      end
    end

    context 'when last played less than 2 years ago' do
      let(:last_played_at) { '2023-01-01' }

      it 'should return false' do
        today = Date.new(2023, 8, 22)
        allow(Date).to receive(:today).and_return(today)
        expect(game.can_be_archived?).to be_falsey
      end
    end
  end
end
