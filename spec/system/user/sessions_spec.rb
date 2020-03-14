# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions", type: :system do
  before do
    common_set_up
  end

  it "sign in user" do
    visit "/users/sign_in"
    fill_in "user_email", with: @user1.email
    fill_in "user_password", with: @user1.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました"
  end

  it "sign out user" do
    sign_in(@user1)
    visit "/"
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました"
  end
end
