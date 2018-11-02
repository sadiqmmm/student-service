class PortfolioItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :description,
             :url,
             :thumb_image_url,
             :banner_image_url,
             :logo_url
end
