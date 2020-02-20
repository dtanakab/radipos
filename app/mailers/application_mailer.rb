# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "Radipos <radipos.site@gmail.com>"
  layout "mailer"
end
