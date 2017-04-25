class SearchController < ApplicationController
  def index
    @games = game_api.search(search: params[:search][:query]) if params[:search]
  end
end
