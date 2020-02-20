# frozen_string_literal: true

class PostMailer < ApplicationMailer
  def creation_email(post)
    @post = post
    @user = User.find(post.user_id)
    @program = @post.corner.program
    mail(
      subject: @post.subject,
      to: @program.email,
      cc: @post.user.email,
      from: "radipos.site@gmail.com"
    )
  end
end
