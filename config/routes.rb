Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'recipes#error'
  post '/recipes' => 'recipes#create'
  get '/recipes' => 'recipes#show_all'
  get '/recipes/:id' => 'recipes#show_one'
  patch '/recipes/:id' => 'recipes#update'
  delete '/recipes/:id' => 'recipes#delete'
end
