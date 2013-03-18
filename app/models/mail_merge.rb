require 'mustache'

class MailMerge < ActiveRecord::Base
  attr_accessible :body_template, :data, :subject_template, :from
  has_many :emails

  after_save :generate_emails

  def generate_emails
    ActiveSupport::JSON.decode(data).each do |context|
      email = self.emails.create(
        :subject => Mustache.render(subject_template, context),
        :body    => Mustache.render(body_template, context),
        :to      => context['email'],
        :from    => from)

      BulkMailer.basic(email).deliver
    end
    self.emails
  end
end
