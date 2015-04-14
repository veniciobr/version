class Pipeline < ActiveRecord::Base
    attr_accessible :name, :comments, :analysis_id
end
