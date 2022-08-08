# frozen_string_literal: true

module Politicians
  class FindPoliticiansQuery
    def initialize(params, ransack_query)
      @params = params
      @ransack_query = ransack_query
      @politicians = search_politicians
    end

    def run
      return politicians.order_by_name if params[:order_by].blank? || params[:order_by] == 'name'

      politicians.order_by_expenses
    end

    private

    attr_accessor :politicians, :ransack_query, :params

    def search_politicians
      params[:query].blank? ? Politician.all : ransack_query.result
    end
  end
end
