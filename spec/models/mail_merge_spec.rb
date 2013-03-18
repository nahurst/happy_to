require 'spec_helper'

describe MailMerge do
  describe 'email generation' do

    it 'should generate emails for a complete mail merge' do
      mm = create(:mail_merge)
      mm.emails.length.should == 4

      email = mm.emails.first
      email.to.should == "leonardo@example.com"
      email.subject.should == "Great to see you Leonardo"
      email.body.should == "Hi Leonardo\nIt was great to see you at the TMNT party!"

      ActionMailer::Base.deliveries.count.should == 4
    end
  end
end
