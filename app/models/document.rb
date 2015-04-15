class Document < ActiveRecord::Base
  attr_accessible :file, :filetype

  mount_uploader :file, FileUploader
  
  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "delete_url" => "/documents/#{id}",
      "delete_type" => "DELETE"
    }
  end

  def self.load_filetypes
    types = {
      'Please Choose...' => '',
      'Genome Data (Bed Files)' => '1',
      'Mapped Reads' => '2',
      'Reference Genomes' => '3',
      'Control / Test Files (.fasta .fastaq)' => '4',
    }
    #types.sort { |a, b| a[1] <=> b[1] }
  end
end
