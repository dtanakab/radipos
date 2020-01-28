# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "programs#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations",
  }
  resources :users, only: %i[show edit update]
  resources :programs, only: %i[show index edit update new create] do
    collection do
      resources :search_results, only: %i(index), controller: "programs/search_results"
    end
  end
  resources :corners, only: %i[new create show edit update]
  resources :posts, only: %i[create]
  resources :favorites, only: %i[create destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
