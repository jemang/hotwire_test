class LikesController < ApplicationController
  before_action :set_item

  def create
    @item.increment! :like_count
    redirect_to @item
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end