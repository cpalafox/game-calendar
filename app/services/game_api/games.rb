class GameApi::Games < GameApi

  def search(options)
    Game.parse_many get("#{url}/games", default_params.merge(options))
  end

  private

  def default_params
    super.merge({
      fields: 'name,expected_release_day,expected_release_month,expected_release_year,expected_release_quarter,original_release_date,platforms,publishers,image,deck'
    })
  end

end
