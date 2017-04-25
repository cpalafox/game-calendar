require "rails_helper"

describe GameApi::Games do

  let(:api) { GameApi::Games.new }

  describe '#search' do
    it 'calls api with right parameters' do
      allow(api).to receive(:get) { [] }
      allow(Game).to receive(:parse_many) { [] }
      params = {:fields=>"name,expected_release_day,expected_release_month,expected_release_year,expected_release_quarter,original_release_date,platforms,publishers,image,deck", :limit=>10, :offset=>0, search: 'metroid'}
      url = api.url + '/games'
      expect(api).to receive(:get).with(url, params) { [] }
      api.search(search: 'metroid')
    end

    context "with results" do
      before(:each) do
        allow(api).to receive(:get) { [{"deck"=>"A co-operative handheld spin-off of the Metroid Prime trilogy has up to four players, as the power-suited Marines of the Galactic Federation, assisting Samus Aran in investigating a possible resurgence of Space Pirates.", "expected_release_day"=>nil, "expected_release_month"=>nil, "expected_release_quarter"=>nil, "expected_release_year"=>nil, "image"=>{ "medium_url"=>"http://www.giantbomb.com/api/image/scale_medium/2831870-screen%20shot%202016-03-03%20at%206.09.11%20pm.png" }, "name"=>"Metroid Prime: Federation Force", "original_release_date"=>"2016-08-19 00:00:00", "platforms"=>[{"api_detail_url"=>"http://www.giantbomb.com/api/platform/3045-117/", "id"=>117, "name"=>"Nintendo 3DS", "site_detail_url"=>"http://www.giantbomb.com/nintendo-3ds/3045-117/", "abbreviation"=>"3DS"}, {"api_detail_url"=>"http://www.giantbomb.com/api/platform/3045-138/", "id"=>138, "name"=>"Nintendo 3DS eShop", "site_detail_url"=>"http://www.giantbomb.com/nintendo-3ds-eshop/3045-138/", "abbreviation"=>"3DSE"}], "resource_type"=>"game"}] }
      end

      it 'returns a Game array' do
        results = api.search(search: "metroid")
        expect(results).to be_kind_of Array
        expect(results.first).to be_kind_of Game
      end
    end

    context "without results" do
      it 'returns an empty array ' do
        allow(api).to receive(:get) { [] }
        results = api.search(search: "metroid")
        expect(results).to be_kind_of Array
        expect(results).to be_empty
      end
    end
  end
end
