# frozen_string_literal: true

require "application_system_test_case"

class Admin::ProgramsTest < ApplicationSystemTestCase
  setup { login_user "user3@test.com", "testtest" }

  test "show program list" do
    visit user_path(users(:user3))
    click_on "管理者用番組一覧ページ"
    assert_text "テスト番組1"
    assert_no_text "テスト番組2"
  end

  test "create program" do
    visit admin_programs_path
    assert_difference("Program.count", 1) do
      click_on "番組を新たに追加"
      fill_in("program[title]", with: "追加した番組")
      fill_in("program[memo]", with: "追加した番組の概要")
      fill_in("program[email]", with: "mail@mail.com")
      fill_in("program[on_air_wday_id]", with: 1)
      attach_file "program[image]", "#{Rails.root}/test/fixtures/images/program.png"
      click_on "登録する"
    end
  end

  test "show detail and update program" do
    visit admin_programs_path
    click_on "テスト番組1"
    click_on "番組の編集"
    fill_in("program[memo]", with: "変更した番組の概要")
    click_on "更新する"
    assert_text "変更した番組の概要"
  end

  test "destroy program" do
    visit admin_program_path(programs(:program1))
    assert_difference("Program.count", -1) do
      click_on "番組の削除"
      sleep(3)
    end
  end
end
