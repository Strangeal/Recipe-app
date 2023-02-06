Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :foods, except: [:update]
  resources :recipes, except: [:update]
  resources :public_recipes, except: [:update]
  resources :general_shopping_list, except: [:update]

end
