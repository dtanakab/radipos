# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Program", type: :system do
  before do
    common_set_up
    @program1, @new_program = create(:program1), build(:program4)
    @corner1, @corner2 = create(:corner1), create(:corner2)
    @post1, @post2 = create(:post1), create(:post2)
    sign_in(@admin)
  end

  it "show program lists for admin" do
    visit "/admin/programs"
    expect(page).to have_content "管理画面"
    expect(page).to have_content "TEST番組1"
  end

  it "show program info for admin" do
    visit "/admin/programs/#{@program1.id}"
    expect(page).to have_content "管理画面"
    expect(page).to have_content "太郎1"
  end

  it "create program" do
    visit "/admin/programs"
    expect {
      click_link "番組を新たに追加"
      fill_in "program[title]", with: @new_program.title
      fill_in "program[email]", with: @new_program .email
      fill_in "program[cast]", with: @new_program .cast
      fill_in "program[on_air_wday_id]", with: @new_program.on_air_wday_id
      attach_file "program[image]", File.join(Rails.root, "spec/fixtures/files/test.jpg")
      click_button "登録する"
    }.to change { Program.count }.by(1)
  end

  it "update program info" do
    visit "/admin/programs/#{@program1.id}"
    click_link "番組の編集"
    fill_in "program[title]", with: "番組名変更"
    click_button "更新する"
    expect(page).to have_content "番組名変更"
  end

  it "destroy program" do
    visit "/admin/programs/#{@program1.id}"
    expect {
      click_link "番組の削除"
    }.to change { Program.count }.by(-1)
  end
end
