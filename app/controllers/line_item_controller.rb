class LineItemController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase

  # get current user
  # get current users purchase
  # accept new line_item
  # accept edit line_item
  # accept delete line_item
  def new
    @line_item = current_user.purchase.line_item.build
  end

  def edit
    if current_user.id == @purchase.user.id
      @line_item = LineItem.find(params[:id])
      # so stuff
    else
      redirect_to root_path, notice: "What do you think you are doing?"
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to purchases_path(@purchase), notice: "Item deleted"
  end

  private
    # Set the current purchase
    def set_purchase
      # @purchase = current_user.purchase ?
      # @purchase = current_user.build ?
    end
end
