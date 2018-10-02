class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :language,
             :logo,
             :slug
end
