class Game
  include ActiveModel::Model
  attr_accessor :id, :name, :description, :platforms, :publishers, :image, :release_dates

  PLATFORMS = { 130 => "Nintendo Switch", 49 => "Xbox One", 48 => "PlayStation 4", 47 => "Virtual Console (Nintendo)", 46 => "Playstation Vita", 45 => "PlayStation Network", 41 => "Wii U", 37 => "Nintendo 3DS" }
  REGIONS = { 1 => "EU", 2 => "NA", 3 => "AU", 4 => "NZ", 5 => "JP", 6 => "CH", 7 => "AS", 8 => "Worldwide" }

  def self.parse(raw_game)
    parsed_release_date_info = parse_release_dates_info(raw_game["release_dates"])
    Game.new(
      id: raw_game["id"],
      name: raw_game["name"],
      description: raw_game["summary"],
      image: raw_game["cover"]["url"],
      platforms: parsed_release_date_info["platforms"],
      release_dates: parsed_release_date_info["release_dates"]
    )
  end

  def self.parse_many(raw_games)
    raw_games.map do |raw_game|
      Game.parse raw_game
    end
  end

  def self.parse_release_dates_info(release_dates)
    hash = { "release_dates" => [], "platforms" => [] }
    release_dates.each do |release_date|
      hash["release_dates"] << {
        REGIONS[release_date["region"]] => {
          "date" => release_date["date"],
          "date_human" => release_date["human"]
        }
      }
      hash["platforms"] << PLATFORMS[release_date["platform"]]
    end
    hash
  end
end
