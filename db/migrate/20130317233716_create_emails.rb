class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.text :body
      t.references :mail_merge

      t.timestamps
    end
    add_index :emails, :mail_merge_id
  end
end
