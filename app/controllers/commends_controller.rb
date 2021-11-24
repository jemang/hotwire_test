class CommendsController < ApplicationController
  before_action :set_item
  before_action :set_commend, only: %i[ show edit update destroy ]

  # GET /commends or /commends.json
  def index
    @commends = @item.commends
  end

  # GET /commends/1 or /commends/1.json
  def show
  end

  # GET /commends/new
  def new
    @commend = @item.commends.new
  end

  # GET /commends/1/edit
  def edit
  end

  # POST /commends or /commends.json
  def create
    @commend = @item.commends.new(commend_params)
    @commend.save
    respond_with_turbo(@commend)
    # respond_to do |format|
    #   if @commend.save
    #     format.turbo_stream
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.turbo_stream { render turbo_stream: turbo_stream.replace(@commend, partial: 'commends/form', locals: { commend: @commend }) }
    #   end
    # end
  end

  # PATCH/PUT /commends/1 or /commends/1.json
  def update
    @commend.update(commend_params)
    respond_with_turbo(@commend)
    # respond_to do |format|
    #   if @commend.update(commend_params)
    #     format.html { redirect_to @commend, notice: "Commend was successfully updated." }
    #     format.json { render :show, status: :ok, location: @commend }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @commend.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /commends/1 or /commends/1.json
  def destroy
    @commend.destroy
    respond_with_turbo(@commend)
    # respond_to do |format|
    #   format.html { redirect_to commends_url, notice: "Commend was successfully destroyed." }
    #   format.turbo_stream
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_commend
    @commend = @item.commends.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def commend_params
    params.require(:commend).permit(:body, :user_id, :item_id, :status)
  end
end
