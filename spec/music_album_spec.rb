require_relative '../music_album'

RSpec.describe MusicAlbum do
  context 'When initializing the music Album' do
    it 'should have publish_date, archived and on_spotify properties' do
      album = MusicAlbum.new('2010-02-02')

      expect(album.publish_date).to eq('2010-02-02')
      expect(album.archived).to be_falsy
      expect(album.on_spotify).to be_falsy
    end
  end
end
