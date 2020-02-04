# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum post_mail_setting: {
    radioname: 0,
    age_and_gender: 1,
    account_information: 2,
  }
  enum about_age: {
    junior_student: 0,
    senior_student: 1,
    undergraduate: 2,
    early_twenties: 3,
    late_twenties: 4,
    early_thirties: 5,
    late_thirties: 6,
    fourties: 7,
    fifties: 8,
    sixties: 9,
  }
  def remember_me
    true
  end
end
