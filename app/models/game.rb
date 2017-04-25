class Game
  attr_reader :name, :description, :expected_release_date, :expected_release_quarter, :platform_array, :publishers, :image

  def initialize(attrs)
    @name = attrs[:name]
    @description = attrs[:description]
    @expected_release_date = attrs[:expected_release_date]
    @expected_release_quarter = attrs[:expected_release_quarter]
    @platform_array = attrs[:platforms]
    @publishers = attrs[:publishers]
    @image = attrs[:image]
  end

  def self.parse(raw_game)
    ex_release_year = raw_game['expected_release_year'].to_i
    ex_release_month = raw_game['expected_release_month'].to_i
    ex_release_day = raw_game['expected_release_day'].to_i
    Game.new(
      name: raw_game["name"],
      description: raw_game["deck"],
      expected_release_quarter: raw_game["expected_release_quarter"],
      image: raw_game["image"]["thumb_url"],
      platforms: raw_game["platforms"].collect { |platform| platform["name"] },
      expected_release_date: Date.valid_date?(ex_release_year, ex_release_month, ex_release_day) ? Date.new(ex_release_year, ex_release_month, ex_release_day) : nil
    )
  end

  def self.parse_many(raw_games)
    raw_games.map do |raw_game|
      Game.parse raw_game
    end
  end

  def platforms
    platform_array.join(', ')
  end
end
