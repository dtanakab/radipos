# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }
  root to: "programs#index"
  resources :programs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
