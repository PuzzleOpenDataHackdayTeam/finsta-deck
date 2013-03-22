FinstaDeck::Application.routes.draw do
  %w(start show compare progress number_type_info svg menu victory game_over).each do |path|
    get "/#{path}"  => "application##{path}", as: path
  end


  root :to => 'application#start'

end
