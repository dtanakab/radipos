# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, { format: "json" } do
    resources :likes, only: [:index, :create, :destroy]
  end
  root to: "programs#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations",
  }
  resources :users, only: %i[show edit update] do
    resources :likes, only: %i[index], controller: "users/likes"
    resources :posted_mails, only: %i[index], controller: "users/posted_mails"
  end
  resources :programs, only: %i[show index]  do
    collection do
      resources :search_results, only: %i[index], controller: "programs/search_results"
      resources :timetables, only: %i[index], controller: "programs/timetables"
    end
  end

  namespace :admin do
    resources :users, only: %i[index edit update destroy]
    resources :programs
    resources :corners
  end

  resources :corners, only: %i[index]
  resources :posts, only: %i[create]
  resource :privacy, only: %i[show]
  resource :term, only: %i[show]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
