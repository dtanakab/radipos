# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected
    def after_sign_in_path_for(resource)
      if current_user.likes.any?
        mylists_path
      else
        recommendations_path
      end
    end
end
