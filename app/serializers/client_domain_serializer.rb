class ClientDomainSerializer < ActiveModel::Serializer
  attributes :id,
             :url

  has_one :client
end
