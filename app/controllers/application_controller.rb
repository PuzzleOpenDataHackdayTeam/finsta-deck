class ApplicationController < ActionController::Base
  protect_from_forgery

  def start
    @stack = loader.new_stack
  end

  def show
    @stack = loader.stack
    @me = loader.me
    @you = loader.you
  end

  def compare
    @you = loader.find(:you)
    @me = loader.find(:me)
    @result = service.compare

    @stack = @result.stack
    render_view
  end


  private
  def loader
    @loader ||= Loader.new(params)
  end

  def service
    Service.new(me: @me, you: @you,
                type: params[:type].to_i,
                stack: loader.stack)
  end


  def render_view
    if @stack.size <= 0
      render :game_over
    elsif @stack.size >= Settings.needed_for_win
      render :victory
    else
      render :compare
    end
  end


end
