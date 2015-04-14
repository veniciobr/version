class CreateAnalyses < ActiveRecord::Migration
  def change
    create_table :analyses do |t|
   	  t.integer :encrypted_id
      t.string :title
      t.string :details
      t.integer :user_id
      t.boolean :enable
      
      t.timestamps
    end
  end
end
