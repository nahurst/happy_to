FactoryGirl.define do
  factory :mail_merge do
    data [
      {'email' => 'leonardo@example.com', 'name' => 'Leonardo', 'company' => 'TMNT'},
      {'email' => 'donatello@example.com', 'name' => 'Donatello', 'company' => 'TMNT'},
      {'email' => 'michaelangello@example.com', 'name' => 'Michaelangello', 'company' => 'TMNT'},
      {'email' => 'raphael@example.com', 'name' => 'Raphael', 'company' => 'TMNT'}
    ].to_json
    subject_template "Great to see you {{name}}"
    body_template "Hi {{name}}\nIt was great to see you at the {{company}} party!"
  end
end
