# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  def new
    @user = User.find(params[:id])
  end

  def show
    @user = User.confirm_by_token(params[:confirmation_token])

    if @user.errors.empty?
      sign_in(@user)
      redirect_to root_path, flash: { notice: "Radiposアカウントが認証されました！" }
    else
      redirect_to root_path, flash: {
        notice: "メールアドレスの認証に失敗しました。恐れ入りますが、以下をお確かめください。<br>
        ・メールアドレス認証のメール送信から24時間以上が経過していないか<br>
        ・既にメールアドレス認証が済んでおり、ログイン画面からパスワードでのログインができないか<br>
        ・上記を確認した上で認証、ログインできない場合、異なるメールアドレスを用いて再度アカウントの作成をお願いいたします。"
      }
    end
  end

  # protected
  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
