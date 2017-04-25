class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def game_api
    @game_api ||= GameApi::Games.new
  end
end
