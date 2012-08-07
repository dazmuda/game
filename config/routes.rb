Game::Application.routes.draw do
  # resources :players, :mobs
  #  match "players/upgrade/:id" => "players#upgrade"
  
  resources :players do
    resources :mobs
  end
  
end
