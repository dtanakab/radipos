# frozen_string_literal: true

class Programs::RecommendationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @programs = Program.corner_attached_list.sort_by { |program| program.posts.count }.reverse
    @programs = Kaminari.paginate_array(@programs).page(params[:page])
  end
end
