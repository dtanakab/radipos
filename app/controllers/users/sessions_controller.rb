# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
    redirect_to root_path, notice: "ログアウトしました" if signed_out
  end
end
