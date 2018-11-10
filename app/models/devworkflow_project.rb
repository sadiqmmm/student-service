class DevworkflowProject < ApplicationRecord
  belongs_to :devworkflow_user

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
