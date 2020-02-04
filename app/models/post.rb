# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :corner

  enum post_mail_setting: {
    radioname: 0,
    age_and_gender: 1,
    account_information: 2,
  }
end
