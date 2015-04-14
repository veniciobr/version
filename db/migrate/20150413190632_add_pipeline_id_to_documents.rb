class AddPipelineIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :pipeline_id, :integer
  end
end
