module DocumentsHelper
	def showFileType id
		case id
		when 1
			'Genome Data (Bed Files)'
		when 2
			'Mapped Reads'
		when 3
			'Reference Genomes'
		when 4
			'Control / Test Files (.fasta .fastaq)'
		else
			'Please Choose...'
		end
	end
end
