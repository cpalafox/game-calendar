class GameApi
  attr_accessor :url

  def initialize()
    @url = 'http://www.giantbomb.com/api'
  end

  protected

  def get(url, parameters)
    Unirest.get(url, parameters: parameters).body["results"]
  end

  private

  def default_params
    {
      field_list: 'name',
      limit: 10,
      offset: 0,
      format: 'json',
      resources: '',
      api_key: ENV['GB_KEY']
    }
  end
end
