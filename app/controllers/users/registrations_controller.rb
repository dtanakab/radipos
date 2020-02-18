# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(sign_up_params)

    if @user.save
      expire_data_after_sign_in!
      redirect_to new_user_confirmation_path(id: @user.id)
    else
      clean_up_passwords @user
      set_minimum_password_length
      respond_with @user
    end
  end

  def edit
  end

  def update
    super
  end

  def destroy
    super
  end
end
