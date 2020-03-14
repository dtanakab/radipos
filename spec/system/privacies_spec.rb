# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Privacy", type: :system do
  it "show privacy polocy" do
    visit "/"
    click_link "プライバシーポリシー"
    expect(page).to have_content "プライバシーポリシーの適用範囲"
  end
end
