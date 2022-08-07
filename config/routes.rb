# frozen_string_literal: true

Rails.application.routes.draw do
  resources :csv_uploads, only: [:index] do
    collection do
      post 'uploader'
    end
  end

  resources :politicians, only: %i[index show] do
    collection do
      delete 'destroy_all'
    end
  end

  root to: 'politicians#index'
end
