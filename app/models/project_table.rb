class ProjectTable < ApplicationRecord
  belongs_to :project
  validates_presence_of :formatted_name, :table_name
end
