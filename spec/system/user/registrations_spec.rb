# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Registrations", type: :system do
  before do
    common_set_up
    @user2 = build(:user2)
    @user1_updated = build(:user1_updated)
  end

  it "create user" do
    visit "/users/sign_up"
    sleep 3
    fill_in "user_email", with: @user2.email
    fill_in "user_password", with: @user2.password
    fill_in "user_password_confirmation", with: @user2.password
    click_button "アカウントを作成"
    expect(page).to have_content "test2@example.comへ受信確認用のメールを送信しました"
  end

  it "destroy user" do
    sign_in(@user1)
    visit "/users/#{@user1.id}"
    click_link "退会する"
    expect {
      page.accept_confirm "Radiposを退会し、本当にアカウントを削除しますか?"
      expect(page).to have_content "アカウントを削除しました"
    }.to change { User.count }.by(-1)
  end

  it "update mail_address" do
    sign_in(@user1)
    visit "/users/#{@user1.id}/edit"
    click_link "メールアドレス/パスワードを変更 ＞"
    @user1_updated = build(:user1_updated)
    fill_in "user_email", with: @user1_updated.email
    fill_in "user_current_password", with: @user1.password, match: :first
    click_button "メールアドレスを変更する"
    expect(page).to have_content "本人確認用メールより確認処理をおこなってください"
  end

  it "update password" do
    sign_in(@user1)
    visit "/users/#{@user1.id}/edit"
    click_link "メールアドレス/パスワードを変更 ＞"
    within all(".form_area")[1] do
      fill_in "user_current_password", with: @user1.password
      fill_in "user_password", with: @user1_updated.password
      fill_in "user_password_confirmation", with: @user1_updated.password
    end
    click_button "パスワードを変更する"
    expect(page).to have_content "アカウント情報を変更しました"
  end
end
