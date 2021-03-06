# frozen_string_literal: true

RSpec.describe "User", type: :system do
  before do
    common_set_up
    @program1, @new_program = create(:program1), build(:program4)
    @corner1, @corner2 = create(:corner1), create(:corner2)
    @post1, @post2 = create(:post1), create(:post2)
    sign_in(@admin)
  end

  it "show user lists for admin" do
    visit "admin/users"
    expect(page).to have_content "ユーザー数：2名"
    expect(page).to have_content "投稿数：2件"
    expect(page).to have_content @user1.email
  end
end
