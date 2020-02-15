# frozen_string_literal: true

class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def index
    like_programs = []
    current_user.likes.each do | like |
      like_programs << Program.find(like.program_id)
    end
    @like_programs = Kaminari.paginate_array(like_programs).page(params[:page])
  end
end
