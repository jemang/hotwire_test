class UnlikesController < ApplicationController
  before_action :set_item

  def create
    @item.increment! :unlike_count
    redirect_to @item
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end