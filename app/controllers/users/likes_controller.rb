# frozen_string_literal: true

class Users::LikesController < ApplicationController
  def index
    @like_programs = []
    current_user.likes.each do | like |
      @like_programs << Program.find(like.program_id)
    end
  end
end
