class PortfolioItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url
  has_one :client
end
