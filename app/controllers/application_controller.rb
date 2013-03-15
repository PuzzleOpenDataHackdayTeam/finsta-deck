class ApplicationController < ActionController::Base
  protect_from_forgery

  def start
    render text: 'start'
  end
end
