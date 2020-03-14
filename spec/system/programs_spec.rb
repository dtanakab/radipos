# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Program", type: :system do
  before do
    common_set_up
    @program1 = create(:program1)
    @corner1, @corner2 = create(:corner1), create(:corner2)
  end

  it "show service top page" do
    visit "/programs"
    expect(page).to have_content "Radiposで簡単にメールを送ろう！"
  end

  it "try sign up without login" do
    visit "/programs"
    click_link "Radiposを使ってみる"
    expect(page).to have_content "会員登録"
  end

  it "try sign up with login" do
    sign_in(@user1)
    visit "/programs"
    click_link "Radiposを使ってみる"
    expect(page).to have_content "すでにログインしています"
  end

  it "show program lists" do
    visit "/programs"
    expect(page).to have_content "TEST番組1"
  end

  it "show program detail without login" do
    visit "/programs"
    within all(".program_card")[0] do
      first("a").click
    end
    expect(page).to have_content "会員登録後送ることができます"
  end

  it "show program detail with login" do
    sign_in(@user1)
    visit "/programs/#{@program1.id}"
    expect(page).to have_content "アカウント情報などから自動で入力"
  end
end
