# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Likes", type: :system do
  before do
    common_set_up
    sign_in(@user1)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
  end

  it "show likes" do
    visit "/users/#{@user1.id}"
    within all(".profile_tabs .profile_tab")[1] do
      first("img").click
    end
    expect(page).to have_content "マイリスト(2件)"
  end

  it "display liked program info" do
    visit "/users/#{@user1.id}/likes"
    within all(".program_card")[0] do
      first("a").click
    end
    expect(page).to have_content "TEST番組1"
  end

  it "show notification with no likes" do
    sign_out(@user2)
    @user2 = create(:user2)
    sign_in(@user2)
    visit "/users/#{@user2.id}/likes"
    expect(page).to have_content "マイリストはまだありません"
  end
end
