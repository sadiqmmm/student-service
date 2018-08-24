class PortfolioAppUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :role
end
