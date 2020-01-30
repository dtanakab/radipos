# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  def show
    @favorite_programs = []
    current_user.favorites.each do | favorite |
      @favorite_programs << Program.find(favorite.program_id)
    end
    if @user.radio_name != ""
      @temp_name = @user.radio_name
    else
      @temp_name = "ラジオネーム未設定"
    end
  end

  def edit
    @age_choices = ["中学生", "高校生", "大学生", "20代前半", "20代後半", "30代前半", "30代後半", "40代", "50代", "60代"]
    @post_mail_settings = ["ラジオネームのみ", "ラジオネーム+年齢性別のみ", "本名や住所含む全てを記載"]
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
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(
        :radio_name, :full_name, :address, :postcode, :email, :about_age, :tel, :gender, :post_mail_setting
      )
    end
end
