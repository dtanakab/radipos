# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Post", type: :system do
  before do
    common_set_up
    @program1, @new_post = create(:program1), build(:post1)
    sign_in(@user1)
  end

  it "selected post mail setting" do
    visit "/programs/#{@program1.id}"
    expect(page).to have_select("post[post_mail_setting]", selected: "ラジオネームのみ")
  end

  it "create radio mail" do
    visit "/programs/#{@program1.id}"
    within all(".corner_form_box")[0] do
      expect {
        fill_in "post[content]", with: @new_post.content
        click_button "送信する"
      }.to change { Post.count }.by(1)
    end
  end

  it "create radio mail without changing settings" do
    visit "/programs/#{@program1.id}"
    within all(".corner_form_box")[0] do
      fill_in "post[content]", with: @new_post.content
      click_button "送信する"
    end
    expect(@user1.posts[-1].post_mail_setting).to eq("radioname")
    expect(@user1.post_mail_setting).to eq("radioname")
  end

  it "create radio mail with temporary changing settings" do
    visit "/programs/#{@program1.id}"
    within all(".corner_form_box")[0] do
      fill_in "post[content]", with: @new_post.content
      select "住所/本名を含むアカウント情報全て", from: "post[post_mail_setting]"
      click_button "送信する"
    end
    expect(@user1.posts[-1].post_mail_setting).to eq("account_information")
    expect(@user1.post_mail_setting).to eq("radioname")
  end
end
