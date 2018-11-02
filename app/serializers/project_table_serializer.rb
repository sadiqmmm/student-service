class ProjectTableSerializer < ActiveModel::Serializer
  attributes :id,
             :formatted_name,
             :table_name

  has_one :project
end
