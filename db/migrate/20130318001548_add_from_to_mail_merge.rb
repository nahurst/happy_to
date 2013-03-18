class AddFromToMailMerge < ActiveRecord::Migration
  def change
    add_column :mail_merges, :from, :string
  end
end
