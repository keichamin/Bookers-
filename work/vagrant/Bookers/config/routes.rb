Rails.application.routes.draw do

resources :books
root to: 'books#top'
get'root'=>'books#top'
get'books'=>'books#index'
patch 'books/:id' => 'books#update', as: 'update_books'
delete 'books/:id' => 'books#destroy', as: 'destroy_books'

end