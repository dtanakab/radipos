# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Recommendations", type: :system do
  before do
    common_set_up
    sign_in(@user1)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
  end

  it "show recommendations" do
    visit "/programs/recommendations"
    expect(page).to have_content "TEST番組3"
  end

  it "go mylists" do
    visit "/programs/recommendations"
    click_link "マイリスト"
    expect(page).to have_content "TEST番組1"
  end
end
