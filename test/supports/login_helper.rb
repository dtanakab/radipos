# frozen_string_literal: true

module LoginHelper
  def login_user(email, password)
    visit "users/sign_in"
    within("#new_user") do
      fill_in("user[email]", with: email)
      fill_in("user[password]", with: password)
    end
    find(".button").click
  end

  def logout
    visit "users/logout"
  end
end
