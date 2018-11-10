class DevworkflowProjectLineItem < ApplicationRecord
  belongs_to :devworkflow_project

  has_many :devworkflow_check_list_items, dependent: :destroy

  accepts_nested_attributes_for :devworkflow_check_list_items,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs[:title].blank? }
end
