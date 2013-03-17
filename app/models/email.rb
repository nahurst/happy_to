class Email < ActiveRecord::Base
  belongs_to :mail_merge
  attr_accessible :body, :from, :subject, :to
end
