Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  # root "articles#index"

  resources :foods, except: [:update]
  resources :recipes, except: [:update] do
    resources :recipe_foods, except: [:update]
  end
  resources :public_recipes, except: [:update]
  resources :general_shopping_lists, except: [:update]

end
