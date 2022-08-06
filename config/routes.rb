# frozen_string_literal: true

Rails.application.routes.draw do
  resources :csv_uploads, only: [:index] do
    collection do
      post 'uploader'
    end
  end
end
