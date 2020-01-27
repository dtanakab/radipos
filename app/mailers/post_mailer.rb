# frozen_string_literal: true

class PostMailer < ApplicationMailer
  default from: "radipos.site@gmail.com"

  def creation_email(post)
    @post = post
    @user = User.find(post.user_id)
    @program = @post.corner.program
    mail(
      subject: @post.subject,
      to: @program.email,
      from: "radipos.site@gmail.com"
    )
  end
end
