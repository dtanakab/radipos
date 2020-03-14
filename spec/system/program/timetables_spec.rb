# frozen_string_literal: true

require "rails_helper"

RSpec.describe "TimeTables", type: :system do
  before do
    common_set_up
    sign_in(@user1)
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
  end

  it "selected today and now timeframe" do
    travel_to("2020-3-1 13:00".to_time)
    visit "/programs/mylists"
    expect(page).to have_select("wday", selected: "日曜")
    expect(page).to have_select("timeframe", selected: "昼(10:00-14:59)")
  end

  it "show timetables" do
    visit "/programs/mylists"
    select "火曜", from: "wday"
    select "朝(05:00-9:59)", from: "timeframe"
    click_button "番組表"
    expect(page).to have_content "TEST番組2"
  end
end
