# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mail_merge do
    data "MyText"
    subject_template "MyString"
    body_template "MyText"
  end
end
