class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :populate_ivars, only: [:show, :compare]


  def compare
    @result = game.compare
    @stack = game.stack
    @type = Type.find(params[:type])
  end

  def number_type_info
    @type = Type.find(params[:type])
    render :layout => "dialog"
  end



  private
  def game
    @game ||= Game.new(params)
  end

  def populate_ivars
    @stack = game.stack
    @me = game.me
    @you = game.you
  end

end
