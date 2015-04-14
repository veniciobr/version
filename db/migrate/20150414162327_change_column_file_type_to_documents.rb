class ChangeColumnFileTypeToDocuments < ActiveRecord::Migration
  def change
    change_column :documents, :filetype, :integer
  end
end
