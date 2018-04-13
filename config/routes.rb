Rails.application.routes.draw do
  devise_for :farmies, controllers: { omniauth_callbacks: "omniauth_callbacks"}
 
 	resources :farmies do
 		resources :profiles
 	end

  root  'home#index'
end
