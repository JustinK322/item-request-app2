class ItemRequestsController < ApplicationController

  before_action :set_item_request, only: [:show, :edit, :update, :destroy]
  #before_update :prevent_update

  #scope :notApproved, lambda {where(:isApproved => false)}

  # GET /item_requests
  # GET /item_requests.json

  def prevent_update

  end

  def not_approved
    @item_requests = ItemRequest.where(isApproved: [false, nil])
    render :index
  end

  def index
    @item_requests = ItemRequest.all
  end

  # GET /item_requests/1
  # GET /item_requests/1.json
  def show
  end

  # GET /item_requests/new
  def new
    @item_request = ItemRequest.new
  end

  # GET /item_requests/1/edit
  def edit
  end

  # POST /item_requests
  # POST /item_requests.json
  def create
    @item_request = ItemRequest.new(item_request_params)

    respond_to do |format|
      if @item_request.save

        NewItemRequestMailer.new_item_request_email(current_user).deliver

        format.html { redirect_to @item_request, notice: 'Item request was successfully created.' }
        format.json { render :show, status: :created, location: @item_request }
      else
        format.html { render :new }
        format.json { render json: @item_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_requests/1
  # PATCH/PUT /item_requests/1.json
  def update
    respond_to do |format|
      if @item_request.update(item_request_params)
        format.html { redirect_to @item_request, notice: 'Item request was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_request }
      else
        format.html { render :edit }
        format.json { render json: @item_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_requests/1
  # DELETE /item_requests/1.json
  def destroy
    @item_request.destroy
    respond_to do |format|
      format.html { redirect_to item_requests_url, notice: 'Item request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approverequest
    @item_request = ItemRequest.find(params[:id])
    @item_request.isApproved = true
    if @item_request.save
      respond_to do |format|
        format.html { redirect_to :action => 'index', notice: 'Item request was successfully updated.' }
        format.json { render :index, status: :ok, location: @item_request }
      end
    else
      format.html { render :edit }
      format.json { render json: @item_request.errors, status: :unprocessable_entity }
    end
  end

  def declinerequest
    @item_request = ItemRequest.find(params[:id])
    @item_request = ItemRequest.find(params[:id])
    @item_request.isApproved = false
    if @item_request.save
      respond_to do |format|
        format.html { redirect_to :action => 'index', notice: 'Item request was successfully updated.' }
        format.json { render :index, status: :ok, location: @item_request }
      end
    else
      format.html { render :edit }
      format.json { render json: @item_request.errors, status: :unprocessable_entity }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item_request
    @item_request = ItemRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_request_params
    params.require(:item_request).permit(:itemName, :reason, :price, :isApproved, :approvedBy, :approvedOn)
  end
end
