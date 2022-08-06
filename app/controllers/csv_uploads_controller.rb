# frozen_string_literal: true

class CsvUploadsController < ApplicationController
  def index; end

  def uploader
    file = upload_params[:csv_file]
    result = CsvUploads::CsvHandlerService.new(file: file).run

    flash[:alert] = t('csv_uploads.upload_error_message') unless result
    flash[:notice] = t('csv_uploads.upload_success_message') if result

    redirect_to csv_uploads_path
  end

  private

  def upload_params
    params.permit(:csv_file)
  end
end
