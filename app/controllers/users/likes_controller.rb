# frozen_string_literal: true

class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def index
    @like_programs_all = current_user.likes.map { | like | Program.find(like.program_id) }
    @like_programs = Kaminari.paginate_array(@like_programs_all).page(params[:page])
  end
end
