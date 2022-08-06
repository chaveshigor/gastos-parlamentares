# frozen_string_literal: true

class CsvUploadsController < ApplicationController
  def index; end

  def uploader
    file = upload_params[:csv_file]
    CsvUploads::StoreDataService.new(file: file).run
  end

  private

  def upload_params
    params.permit(:csv_file)
  end
end
