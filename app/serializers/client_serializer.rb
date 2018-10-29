class ClientSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :subdomain

  has_many :client_domains
end
