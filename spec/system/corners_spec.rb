# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Corner", type: :system do
  before do
    common_set_up
    @program1 = create(:program1)
    create(:corner1)
  end

  it "show corner" do
    visit "/programs/#{@program1.id}"
    expect(page).to have_content "テストコーナー1"
  end
end
