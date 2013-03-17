class CreateMailMerges < ActiveRecord::Migration
  def change
    create_table :mail_merges do |t|
      t.text :data
      t.string :subject_template
      t.text :body_template

      t.timestamps
    end
  end
end
