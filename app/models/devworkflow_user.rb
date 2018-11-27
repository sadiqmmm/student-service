class DevworkflowUser < ApplicationRecord
  belongs_to :client
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :name

  has_many :devworkflow_projects, dependent: :destroy
  has_many :devworkflow_check_list_items, dependent: :destroy

  def filtered_field
    "[filtered]"
  end

  def filtered_field_2
    "[filtered]"
  end

  def dw_user_id
    self.client.auth_token + String(self.id)
  end

  def column_names_merged_with_images
    DevworkflowUser.column_names
      .select { |column| !['client_id', 'password_digest', 'created_at', 'updated_at'].include?(column) }
      .push(['password', 'password_confirmation'])
      .flatten
      .uniq
  end
end
