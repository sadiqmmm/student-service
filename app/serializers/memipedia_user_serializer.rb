class MemipediaUserSerializer < ActiveModel::Serializer
  attributes :created_at,
             :email,
             :id
end
