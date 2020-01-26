# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "programs#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }
  resources :users, only: %i[show edit update]
  resources :programs, only: %i[show index edit update new create] do
    resources :corners, only: %i[new create]
  end
  resources :corners, only: %i[show edit update]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
