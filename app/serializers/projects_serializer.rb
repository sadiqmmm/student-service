class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :language,
             :logo,
             :white_logo,
             :slug
end
