# frozen_string_literal: true

class PoliticiansController < ApplicationController
  before_action :set_query, only: [:index]

  def index
    @politicians = params[:query].blank? ? Politician.all : @query.result
    @politicians = @politicians.order(name: :asc)
  end

  def show
    @politician = Politician.find_by(id: politician_params[:id])
    @expenses = @politician.expenses.includes(:provider).order(generation_date: :desc)
  end

  private

  def politician_params
    params.permit(:id)
  end

  def set_query
    @query = Politician.search(params[:query])
  end
end
