class DevworkflowProject < ApplicationRecord
  belongs_to :devworkflow_user
  belongs_to :client

  validates_presence_of :title, :main_objective
  validates :main_objective, length: { maximum: 130 }
  validates :title, length: { maximum: 55 }

  has_many :devworkflow_project_line_items, dependent: :destroy

  enum status: {
    active:   0,
    archived: 1
  }

  def self.sort_by_last_updated
    order('updated_at DESC')
  end

  after_create :build_project_line_items

  def dw_user_id
    self.client.auth_token + String(self.devworkflow_user.id)
  end

  def column_names_merged_with_images
    DevworkflowProject.column_names
      .select { |column| !['client_id', 'created_at', 'updated_at', 'status'].include?(column) }
      .flatten
      .uniq
  end

  private

    def build_project_line_items
      line_items = [
        "Wireframes",
        "Sitemap",
        "User Stories",
        "UML Diagrams",
        "Hi-Res Designs",
        "Logo/Images",
        "Frontend Implementation",
        "Backend API",
        "Automated Tests",
        "Deployment"
      ]

      line_items.each do |line_item|
        self.devworkflow_project_line_items.create!(title: line_item)
      end
    end
end
