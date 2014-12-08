RailsProfiler::Engine.routes.draw do
  get '/widget', to: 'widget#index'
  get '/result', to: 'widget#result'
end
