# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Mylists", type: :system do
  before do
    common_set_up
    sign_in(@user1)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
    @like1, @like2 = create(:like1), create(:like2)
    @corner5, @corner6 = create(:corner5), create(:corner6)
  end

  it "show mylists" do
    visit "/"
    within all(".header")[0] do
      first("img").click
    end
    expect(page).to have_content "TEST番組2"
  end

  it "click recommendations" do
    visit "/programs/mylists"
    click_link "オススメ人気"
    expect(page).to have_content "TEST番組3"
  end
end
