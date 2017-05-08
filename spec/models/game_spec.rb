require "rails_helper"

describe Game do
  let(:raw_games) {
    [{"id"=>26758, "name"=>"Super Mario Odyssey", "first_release_date"=>1514678400000, "release_dates"=>[{"category"=>6, "platform"=>130, "date"=>1514678400000, "region"=>8, "human"=>"2017-Q4", "y"=>2017, "m"=>12}], "cover"=>{"url"=>"//images.igdb.com/igdb/image/upload/t_thumb/kjfbrxvlqgvkcv4uwvif.png", "cloudinary_id"=>"kjfbrxvlqgvkcv4uwvif", "width"=>1200, "height"=>1121}} ]
  }

  describe '.parse_many' do
    it 'parses passed array' do
      expect(Game).to receive(:parse).once
      Game.parse_many(raw_games)
    end

    it 'returns a Game array' do
      results = Game.parse_many(raw_games)
      expect(results).to be_kind_of Array
      expect(results.first).to be_kind_of Game
    end
  end

  describe '.parse' do
    it 'returns a game object' do
      expect(Game.parse(raw_games.first)).to be_kind_of Game
    end
  end
end
