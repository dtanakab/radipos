# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "programs#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }
  resources :users, only: %i[show edit update]
  resources :programs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
