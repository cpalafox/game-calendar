class GameApi::Games < GameApi

  def search(options)
    Game.parse_many get("#{url}/games/", default_params.merge(options))
  end

  private

  def default_params
    super.merge({
      fields: 'name,summary,first_release_date,release_dates,cover'
    })
  end

end
