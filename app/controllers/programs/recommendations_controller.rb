# frozen_string_literal: true

class Programs::RecommendationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @programs = Kaminari.paginate_array(Program.corner_attached_list).page(params[:page])
  end
end
