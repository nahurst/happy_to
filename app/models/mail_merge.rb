require 'mustache'

class MailMerge < ActiveRecord::Base
  attr_accessible :body_template, :data, :subject_template
  has_many :emails

  def generate_emails(from)
    ActiveSupport::JSON.decode(data).each do |context|
      email = self.emails.build(
        :subject => Mustache.render(subject_template, context),
        :body    => Mustache.render(body_template, context),
        :to      => context['email'],
        :from    => from)

      BulkMailer.basic(email).deliver
      email.save!
    end
    self.emails
  end
end
