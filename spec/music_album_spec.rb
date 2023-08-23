require_relative '../music_album'

RSpec.describe MusicAlbum do
  before(:each) do
    @album = MusicAlbum.new('2010-02-02')
    @album2 = MusicAlbum.new('2020-01-01', on_spotify: true)
    @album3 = MusicAlbum.new('2010-01-01', on_spotify: true)
  end

  context 'When initializing the music Album' do
    it 'should have publish_date, archived and on_spotify properties' do
      expect(@album.publish_date).to eq('2010-02-02')
      expect(@album.archived).to be_falsy
      expect(@album.on_spotify).to be_falsy
    end
  end

  it 'is on_spotify if it was initialized' do
    expect(@album2.on_spotify).to be_truthy
  end

  it 'can be archived if publish_date is greater than ten and on_spotify is true' do
    expect(@album2.can_be_archived?).to be_falsy
    expect(@album3.can_be_archived?).to be_truthy
  end
end
