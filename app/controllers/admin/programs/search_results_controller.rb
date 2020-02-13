# frozen_string_literal: true

class Admin::Programs::SearchResultsController < AdminController
  def index
    result = Program.search(params[:word])
    @search_results = result.page(params[:page])
  end
end
