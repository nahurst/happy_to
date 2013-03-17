class MailMerge < ActiveRecord::Base
  attr_accessible :body_template, :data, :subject_template
end
