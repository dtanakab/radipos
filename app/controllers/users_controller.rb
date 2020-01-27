# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  def show
    if @user.radio_name != ""
      @temp_name = @user.radio_name
    else
      @temp_name = "ラジオネーム未設定"
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to @user, notice: t("messages.updated")
    else
      render :show
    end
  end

  private
    def set_user
      @user = current_user
    end
    def user_params
      params.require(:user).permit(
        :radio_name, :full_name, :address, :postcode, :email, :birth_year, :birth_month, :birth_day, :tel, :gender
      )
    end
end
