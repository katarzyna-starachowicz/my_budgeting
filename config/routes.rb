Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :schemas, only: :index do
    get :new_categories_group, :new_category
    post :create_categories_group, :create_category
  end

  root to: "budgets#show"
end
