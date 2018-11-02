class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :language,
             :logo,
             :white_logo,
             :slug,
             :route_namespace

  has_many :endpoints
  has_many :project_tables
end
