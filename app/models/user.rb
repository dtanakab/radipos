# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def age
    birthday = Date.new(self.birth_year.to_i, self.birth_month.to_i, self.birth_day.to_i)
    age = (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
    age.to_s
  end
end
