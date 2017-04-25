class GameApi
  attr_accessor :url

  def initialize()
    @url = 'https://igdbcom-internet-game-database-v1.p.mashape.com'
  end

  protected

  def get(url, parameters)
    Unirest.get(url, parameters: parameters, headers: headers).body
  end

  private

  def default_params
    {
      fields: 'name',
      limit: 10,
      offset: 0
    }
  end

  def headers
    { "X-Mashape-Key" => ENV['IGDB_KEY'], "Accept" => "application/json" }
  end
end
