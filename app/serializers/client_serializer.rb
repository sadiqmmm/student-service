class ClientSerializer < ActiveModel::Serializer
  attributes :id, :email, :subdomain
end
