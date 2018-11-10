class Devworkflow::ProjectLineItemsController < ApplicationController
  before_action :set_devworkflow_project_line_item

  include DevworkflowAuthenticationConcern

  def update
    if @devworkflow_project_line_item.update(devworkflow_project_line_item_params)
      render json: @devworkflow_project_line_item
    else
      render json: @devworkflow_project_line_item.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @devworkflow_project_line_item
  end

  private

    def set_devworkflow_project_line_item
      @devworkflow_project_line_item = DevworkflowProjectLineItem.find(params[:id])
    end

    def devworkflow_project_line_item_params
      params.require(:project_line_item).permit(
        :title,
        :description,
        :completed,
        check_list_items_attributes: [
          :id,
          :title,
          :completed,
          :user_id
        ]
      )
    end
end
