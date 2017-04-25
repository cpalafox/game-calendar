require "rails_helper"

describe GameApi::Games do

  let(:api) { GameApi::Games.new }

  describe '#search' do
    it 'calls api with right parameters' do
      allow(api).to receive(:get) { [] }
      allow(Game).to receive(:parse_many) { [] }
      params = {:fields=>"name,summary,first_release_date,release_dates,cover", :limit=>10, :offset=>0, search: 'mario'}
      url = api.url + '/games/'
      expect(api).to receive(:get).with(url, params) { [] }
      api.search(search: 'mario')
    end

    context "with results" do
      before(:each) do
        allow(api).to receive(:get) { {"id"=>26758, "name"=>"Super Mario Odyssey", "first_release_date"=>1514678400000, "release_dates"=>[{"category"=>6, "platform"=>130, "date"=>1514678400000, "region"=>8, "human"=>"2017-Q4", "y"=>2017, "m"=>12}], "cover"=>{"url"=>"//images.igdb.com/igdb/image/upload/t_thumb/kjfbrxvlqgvkcv4uwvif.png", "cloudinary_id"=>"kjfbrxvlqgvkcv4uwvif", "width"=>1200, "height"=>1121}} }
        allow(Game).to receive(:parse_many) { [Game.new] }
      end

      it 'returns a Game array' do
        results = api.search(search: "mario")
        expect(results).to be_kind_of Array
        expect(results.first).to be_kind_of Game
      end
    end

    context "without results" do
      it 'returns an empty array ' do
        allow(api).to receive(:get) { [] }
        results = api.search(search: "mario")
        expect(results).to be_kind_of Array
        expect(results).to be_empty
      end
    end
  end
end
