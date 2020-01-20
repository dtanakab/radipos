class TaskMailer < ApplicationMailer
  def creation_email()
    mail(
      subject: 'Radiposお試しメール'
      to: 'karugamo.highkick@gmail.com'
      from: 'radipos@gmail.com'
    )
  end
end
