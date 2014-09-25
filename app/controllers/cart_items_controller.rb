class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    #IPSocket.getaddress("www.sandbox.paypal.com")
    #@cart_items = CartItem.all
    
    if current_user == nil
      @cart_items = Array.new
      if session[:music_cart] != nil
        visitedArtistId = nil
        session[:music_cart].each do |cart_item_row|
          cart_item_temp = CartItem.new
          cart_item_temp.product_id = cart_item_row[:product_id]
          cart_item_temp.product_name = cart_item_row[:product_name]
          cart_item_temp.product_final_price = cart_item_row[:product_final_price]
          visitedArtistId = cart_item_row[:product_user_id]
          @cart_items.push(cart_item_temp)
        end
        
        if visitedArtistId == nil
          @continueShoppingLink = root_path
        else
          visitedArtist = User.find(visitedArtistId)
          visitedArtistName = visitedArtist.first_name+" "+visitedArtist.last_name
          @continueShoppingLink = artist_dashboard_path(id: visitedArtist.id.to_s+':'+visitedArtistName.parameterize) 
        end
        
      else
        @continueShoppingLink = root_path
      end
      
    else
      @cart = Cart.where(:user_id => current_user.id).first
      @continueShoppingLink = root_path
      @cart_items = []
      if @cart != nil
        lastItem = nil
        @cart.cart_items.each do |item|
          lastItem = item
        end
        @cart_items = @cart.cart_items
        if lastItem != nil
          lastItemRow = Audio.find(lastItem.product_id)
          visitedArtist = User.find(lastItemRow.user_id)
          visitedArtistName = visitedArtist.first_name+" "+visitedArtist.last_name
          @continueShoppingLink = artist_dashboard_path(id: lastItemRow.user_id.to_s+':'+visitedArtistName.parameterize) 
          
        end        
      end
    end    
    
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
    redirect_to cart_items_url
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :product_id, :product_name, :quantity, :product_price, :product_final_price)
    end
end
