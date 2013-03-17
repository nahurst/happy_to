require 'spec_helper'

describe MailMerge do
  describe 'email generation' do

    it 'should generate emails for a complete mail merge' do
      mm = create(:mail_merge)
      mm.generate_emails
      mm.emails.length.should == 4

      email = mm.first
      email.to.should == "leonardo@example.com"
      email.subject.should == "Great to see you Leonardo"
      email.body.should == "Hi Leonardo\nIt was great to see you at the TMNT party!"
    end
  end
end
