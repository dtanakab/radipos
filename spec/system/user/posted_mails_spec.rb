# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PostedMails", type: :system do
  before do
    common_set_up
    sign_in(@user1)
    @program1 = create(:program1)
  end

  it "show posted_mails" do
    visit "/users/#{@user1.id}"
    within all(".profile_tabs .profile_tab")[2] do
      first("img").click
    end
    expect(page).to have_content "投稿したメール(2件)"
  end

  it "display posted program info" do
    visit "/users/#{@user1.id}/posted_mails"
    within all(".posted_program_info")[0] do
      first("a").click
    end
    expect(page).to have_content "TEST番組1"
  end

  it "show notification with no posts" do
    sign_out(@user1)
    @user2 = create(:user2)
    sign_in(@user2)
    visit "/users/#{@user2.id}/posted_mails"
    expect(page).to have_content "投稿したメールはまだありません"
  end
end
