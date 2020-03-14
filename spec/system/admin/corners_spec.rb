# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Corner", type: :system do
  before do
    common_set_up
    @program1 = create(:program1)
    @corner1, @corner2, @new_corner = create(:corner1), create(:corner2), build(:corner7)
    sign_in(@admin)
    visit "/admin/programs/#{@program1.id}"
  end

  it "show corner for admin" do
    expect(page).to have_content "管理画面"
    expect(page).to have_content "テストコーナー2"
  end

  it "create corner" do
    expect {
      click_link "コーナーを追加"
      fill_in "corner[title]", with: @new_corner.title
      fill_in "corner[subject]", with: @new_corner.subject
      fill_in "corner[introduction]", with: @new_corner.introduction
      click_button "登録する"
    }.to change { Corner.count }.by(1)
    expect(page).to have_content "テストコーナー7"
  end

  it "update corner info" do
    click_link "テストコーナー2"
    fill_in "corner[title]", with: "コーナー名変更"
    click_button "更新する"
    expect(page).to have_content "コーナー名変更"
  end

  it "destroy corner" do
    expect {
      click_link "テストコーナー2"
      click_link "コーナー削除"
    }.to change { Corner.count }.by(-1)
  end
end
