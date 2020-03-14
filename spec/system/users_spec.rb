# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User", type: :system do
  before do
    common_set_up
    @user3, @user1_updated = create(:user3), build(:user1_updated)
  end

  it "show mypage without radio_name" do
    sign_in(@user3)
    visit "/"
    click_link "マイページ"
    expect(page).to have_content "ラジオネームが未設定です"
  end

  it "show mypage with radio_name" do
    sign_in(@user1)
    visit "/"
    click_link "マイページ"
    expect(page).to have_content "TEST1ラジオネーム"
  end

  it "not display personal info" do
    sign_in(@user1)
    visit "/users/#{@user1.id}"
    expect(page).not_to have_content "#{@user1.address}"
  end

  it "update settings and display personal info" do
    sign_in(@user1)
    visit "/users/#{@user1.id}"
    click_link "アカウント設定とプライバシー"
    select "住所/本名を含むアカウント情報全て", from: "user[post_mail_setting]"
    expect(page).to have_content "#{@user1.address}"
  end
end
