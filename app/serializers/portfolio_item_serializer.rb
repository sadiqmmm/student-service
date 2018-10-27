class PortfolioItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description,
             :url,
             :thumb_image_url,
             :banner_image_url

  has_one :client
end
