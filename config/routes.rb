# frozen_string_literal: true

Rails.application.routes.draw do
  get '/uploader', to: 'uploads#uploader'
end
