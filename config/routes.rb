Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create]  # a bookmark belongs to a list
  end
  resources :bookmarks, only: [:destroy] # for destroy the link to list is not needed, it already has it's own id
end
