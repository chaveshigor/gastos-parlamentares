# frozen_string_literal: true

class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all.order(name: :asc)
  end

  def show
    @politician = Politician.find_by(id: politician_params[:id])
    @expenses = @politician.expenses.includes(:provider).order(generation_date: :desc)
  end

  private

  def politician_params
    params.permit(:id)
  end
end
