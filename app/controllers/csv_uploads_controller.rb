# frozen_string_literal: true

class CsvUploadsController < ApplicationController
  def index; end

  def uploader
    file = upload_params[:csv_file]
    
  end

  private

  def upload_params
    params.permit(:csv_file)
  end
end
