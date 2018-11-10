class DevworkflowUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email

  has_many :devworkflow_projects
end
