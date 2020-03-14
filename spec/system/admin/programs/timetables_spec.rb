# frozen_string_literal: true

require "rails_helper"

RSpec.describe "TimeTables", type: :system do
  before do
    common_set_up
    sign_in(@admin)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
  end

  it "show timetables for admin" do
    visit "admin/programs"
    select "火曜", from: "wday"
    select "朝(05:00-9:59)", from: "timeframe"
    click_button "番組表"
    expect(page).to have_content "TEST番組2"
  end
end
