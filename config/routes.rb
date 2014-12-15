BookAdmin::Application.routes.draw do
  root 'my#index'
  devise_for :users
  get "books/index"
  resources :books
  post "books/confirm", as: "book_confirm"
  post "books/multiple_new", as: "book_multiple_new"
  post "books/multiple_create", as: "book_multiple_create"
  resources :biblios
  post "biblios/confirm", as: "biblio_confirm"
  resources :shelves
  resources :users
  resources :lent_histories
  get "lent_histories/return/new" => "lent_histories#return_new"
  get "my" => "my#index"
  resources :groups
end
