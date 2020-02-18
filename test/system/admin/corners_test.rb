# frozen_string_literal: true

require "application_system_test_case"

class Admin::CornersTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show corner" do
    visit "/admin/programs/#{programs(:program1).id}"
    assert_text "テストコーナー1"
  end
  test "new and create corner" do
    visit "/admin/programs/#{programs(:program1).id}"
    assert_difference("Corner.count", 1) do
      click_on "コーナーを追加"
      fill_in("corner[title]", with: "追加したコーナータイトル")
      fill_in("corner[subject]", with: "コーナーの追加の件")
      fill_in("corner[introduction]", with: "コーナーを追加しました")
      click_on "登録する"
      assert_text "コーナーを追加しました"
    end
  end

  test "edit and update corner" do
    visit "/admin/programs/#{programs(:program1).id}"
    click_on "テストコーナー1"
    fill_in("corner[title]", with: "変更したコーナータイトル")
    click_on "更新する"
    assert_text "変更したコーナータイトル"
  end

  test "destroy corner" do
    visit "/admin/programs/#{programs(:program1).id}"
    assert_difference("Corner.count", -1) do
      click_on "テストコーナー1"
      click_on "コーナー削除"
      assert_no_text "テストコーナー1"
    end
  end
end
