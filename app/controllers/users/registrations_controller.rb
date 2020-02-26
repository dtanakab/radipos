# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def edit
  end

  def update
    super
  end

  def destroy
    super
  end

  protected
    def after_inactive_sign_up_path_for(resource)
      new_user_confirmation_path(id: @user.id)
    end
end
