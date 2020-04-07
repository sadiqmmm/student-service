class MemipediaUser < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email, scope: :client_id

  belongs_to :client
  belongs_to :app_template, optional: true

  has_many :memipedia_posts, dependent: :destroy

  def can_modify_user?(user_id)
    id.to_s == user_id.to_s
  end

  def column_names_merged_with_images
    MemipediaUser.column_names
      .select { |column| !['client_id', 'app_template_id', 'password_digest', 'updated_at'].include?(column) }
      .push(['id', 'email', 'password', 'password_confirmation', 'created_at'])
      .flatten
      .uniq
  end
end
