# frozen_string_literal: true

class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  def index
    @like_programs = Kaminari.paginate_array(current_user.programs).page(params[:page])
  end
end
