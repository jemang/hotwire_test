class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  respond_to :turbo_stream, only: %i[create update destroy]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.save
    # respond_with(@item)
    respond_with_turbo(@item, redirect: true)
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to items_path, notice: "Item was successfully created." }
    #     # format.turbo_stream
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     # format.turbo_stream { render turbo_stream: turbo_stream.replace(@item, partial: 'items/form', locals: { item: @item }) }
    #   end
    # end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @item.update(item_params)
    respond_with(@item)
    # respond_with_turbo(@item)
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: "Item was successfully updated." }
    #     format.turbo_stream
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_with(@item)
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
    #   # format.turbo_stream {" "}
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :status, :complete)
  end
end
