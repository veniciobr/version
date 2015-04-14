class AddFiletypeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :filetype, :text
  end
end
