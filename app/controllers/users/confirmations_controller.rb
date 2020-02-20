# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  def new
    @user = User.find(params[:id])
  end

  def create
    super
  end

  def show
    @user = User.confirm_by_token(params[:confirmation_token])

    if @user.errors.empty?
      sign_in(@user)
      redirect_to edit_user_path(@user), flash: { notice: t("devise.confirmations.confirmed") }
    else
      redirect_to root_path, flash: { notice: t("devise.failure.unconfirmed_message") }
    end
  end
end
