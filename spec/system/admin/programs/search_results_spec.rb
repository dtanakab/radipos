# frozen_string_literal: true

require "rails_helper"

RSpec.describe "SearchResults", type: :system do
  before do
    common_set_up
    sign_in(@admin)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
  end

  it "show search results for admin" do
    visit "admin/programs"
    fill_in "word", with: "花子2"
    click_button "検索"
    expect(page).to have_content "TEST番組2"
  end
end
