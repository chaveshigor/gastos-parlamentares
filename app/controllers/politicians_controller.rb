# frozen_string_literal: true

class PoliticiansController < ApplicationController
  before_action :set_query, only: [:index]

  def index
    @politicians = params[:query].blank? ? Politician.all : @query.result
    @politicians = @politicians.order(name: :asc)

    if @politicians.blank?
      flash[:notice] = t('csv_uploads.upload_needed')
      redirect_to csv_uploads_path
    end
  end

  def show
    @politician = Politician.find_by(id: politician_params[:id])
    @expenses = @politician.expenses.includes(:provider).order(generation_date: :desc)
  end

  def destroy_all
    result = Politicians::DeleteAllService.new.run

    flash[:alert] = t('csv_uploads.destroy_error_message') unless result
    flash[:notice] = t('csv_uploads.destroy_success_message') if result

    redirect_to csv_uploads_path
  end

  private

  def politician_params
    params.permit(:id)
  end

  def set_query
    @query = Politician.ransack(params[:query])
  end
end
