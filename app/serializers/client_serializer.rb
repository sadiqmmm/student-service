class ClientSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :subdomain,
             :auth_token

  has_many :client_domains
end
