class EndpointSerializer < ActiveModel::Serializer
  attributes :title,
             :link,
             :http_verb,
             :id
end
