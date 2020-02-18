# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  before_action :require_user_themselves

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to @user, notice: "ラジオメールの設定が更新されました"
    else
      render :show
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def require_user_themselves
      unless @user == current_user
        redirect_to root_path, alert: "ユーザー本人のみマイページの確認が可能です"
      end
    end

    def user_params
      params.require(:user).permit(
        :radio_name, :full_name, :address, :postcode, :email, :about_age, :tel, :gender, :post_mail_setting
      )
    end
end
