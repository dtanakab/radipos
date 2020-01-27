# frozen_string_literal: true

class Programs::SearchResultsController < ApplicationController
  def index
    result = Program.search(params[:word])
    @search_results = result.page(params[:page])
  end
end
