class CreatePipelines < ActiveRecord::Migration
  def change
    create_table :pipelines do |t|
      t.integer :analysis_id
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
