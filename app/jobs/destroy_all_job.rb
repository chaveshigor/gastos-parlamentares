# frozen_string_literal: true

class DestroyAllJob < ApplicationJob
  queue_as :default

  def perform
    Politicians::DeleteAllService.new.run
  end
end
