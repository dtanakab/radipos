# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Term", type: :system do
  it "show terms" do
    visit "/"
    click_link "利用規約"
    expect(page).to have_content "第1条(定義)"
  end
end
