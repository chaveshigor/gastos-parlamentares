# frozen_string_literal: true

Rails.application.routes.draw do
  resources :uploads, only: [:index] do
    collection do
      post 'uploader'
    end
  end
end
