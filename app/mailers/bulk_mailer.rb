class BulkMailer < ActionMailer::Base

  def basic(email)
    @body = email.body
    mail(:to => email.to,
         :from => email.from,
         :subject => email.subject)
  end

end
