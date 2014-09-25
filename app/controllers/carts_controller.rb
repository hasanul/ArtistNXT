class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :confirm
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    redirect_to cart_items_url
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    redirect_to cart_items_url
  end

  # GET /carts/new
  def new
    
    @cart = Cart.new    
    pid = params[:pid]
    
    ##if the user is not logged in, save it to session
    if current_user == nil
      
      if session[:music_cart] == nil
        session[:music_cart] = Array.new
      end
      
        
      if pid != nil ##search in the array, if not found, then push
        alreadyAddedtoCart = false
        if session[:music_cart].length > 0
          session[:music_cart].each do |cart_item_row|
            if cart_item_row[:product_id] == pid
              alreadyAddedtoCart = true
              break;
            end
          end
        end        
        if !alreadyAddedtoCart
            product = Audio.find(pid)
            cart_row = {
              :product_id => pid,
              :product_final_price => product.price,
              :product_name => product.title,
              :product_user_id      => product.user_id
            }
            session[:music_cart].push(cart_row)
        end
      end
    else#logged in
      ## first check if this user has any cart already
      previous_cart = Cart.where(:user_id => current_user.id).first
      
      unless previous_cart
        previous_cart = Cart.create(user_id:current_user.id,
                             cart_number:SecureRandom.uuid,
                             cart_total:'0',
                             ip_address: request.remote_ip
                            )
      end
      
      ## add product to cart item
      product = Audio.find(pid)
      if product!=nil
        # check if this product is already added
        # If yes, update quantity 
        previous_cart_item = CartItem.where(:cart_id => previous_cart.id, :product_id => product.id).first
        
        if previous_cart_item==nil
          previous_cart_item = CartItem.create(cart_id: previous_cart.id,
                               product_id: product.id,
                               product_name: product.title,
                               quantity: 1,
                               product_price: product.price,
                               product_final_price: product.price
                              )
        end
        
      end      
    end
    
    redirect_to cart_items_url, notice: 'Item was successfully added to Cart.'
    
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url }
      format.json { head :no_content }
    end
  end
  
  #only for guest users
  def remove_item
    product_id = params[:product_id]
    tempCartSession = Array.new
    if session[:music_cart] != nil && session[:music_cart].length > 0
      session[:music_cart].each do |cart_item_row|
        if cart_item_row[:product_id] != product_id
          tempCartSession.push(cart_item_row)
        end
      end
    end
    session[:music_cart] = tempCartSession
    redirect_to cart_items_url, notice: 'Item was successfully removed from Cart.'
  end
  
  # Checkout
  def checkout
    if current_user != nil
      @cart = Cart.where(:user_id => current_user.id).first
      if @cart == nil
        redirect_to root_path, notice: 'No item in cart.'
      end
      
    else
      redirect_to new_user_session_path, notice: 'Please login for checkout.' 
    end    
  end
  
  # Confirm Checkout
  def confirm
    if current_user == nil
      redirect_to new_user_session_path, notice: 'Please login for confirming checkout.' 
    end
    settings = Settings.find(1);
    paypal_url = settings.sandbox ? "https://www.sandbox.paypal.com/cgi-bin/webscr" : "https://www.paypal.com/cgi-bin/webscr"
    merchant_email = settings.sandbox ? settings.sandbox_merchant_email : settings.paypal_merchant_email 
    currency_3_code = settings.currency=="" ? 'USD' : settings.currency
    
    @cart = Cart.where(:user_id => current_user.id).take
    
    
    order_subtotal = 0;
    @cart.cart_items.each do |item|
      order_subtotal += item.product_final_price
    end
    
    order_tax = 0
    order_total = order_subtotal + order_tax
    
    # create order entry
    order = Order.new
    order.user_id = @cart.user_id
    order.order_number = SecureRandom.uuid
    order.order_subtotal = order_subtotal
    order.order_tax = order_tax
    order.order_total = order_total
    order.order_status = 0
    order.order_currency = currency_3_code
    order.customer_note = ''
    order.ip_address = request.remote_ip
    order.customer_note = params[:customer_note]
    
    order.save
    
    # create order items entry
    item_hidden_field = '';
    
    @cart.cart_items.each_with_index do |item, index|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.user_id = order.user_id
      order_item.product_id = item.product_id
      order_item.product_name = item.product_name
      order_item.product_quantity = item.quantity
      order_item.product_item_price = item.product_price
      order_item.product_tax = 0
      order_item.product_final_price = item.product_final_price
      order_item.order_status = 0
      order_item.unique_key = SecureRandom.uuid      
      order_item.save
      
      # create item rows for paypal
      item_hidden_field += "<input type='hidden' name='item_name_"+(index+1).to_s+"' value='"+item.product_name.to_s+"' />";
      item_hidden_field += "<input type='hidden' name='amount_"+(index+1).to_s+"' value='"+item.product_final_price.round(2).to_s+"' />";
      item_hidden_field += "<input type='hidden' name='quantity_"+(index+1).to_s+"' value='"+item.quantity.to_s+"' />";
      
    end
    
    # clear cart
    #@cart.cart_items.destroy
    @cart.destroy
    
    # redirect to paypal
    post_vars = {
          :cmd => '_cart',
          :upload => '1',
          :business => merchant_email, #Email address or account ID of the payment recipient (i.e., the merchant).
          :receiver_email => merchant_email, #Primary email address of the payment recipient (i.e., the merchant
          :order_number => order.order_number,
          :invoice => order.order_number,
          :custom => Base64.encode64("Music Purchase"),
          #:item_name => "Music Purchase",
          :amount => order_total.round(2),
          :currency_code => currency_3_code,
          :return => root_url,
          :cancel_return => root_url,
          :notify_url => payment_notifications_url,
          :rm => '2', #the buyer’s browser is redirected to the return URL by using the POST method, and all payment variables are included
          :no_shipping => 1,
          :no_note => 1
    }
    paypal_form = '<html><head><title>Redirection</title><head></head><body><div style="margin: auto; text-align: center;">'
    paypal_form += "<form action='#{paypal_url}' method='post' name='paypal_form' id='paypal_form'>";
    paypal_form += '<input type="submit" id="paypal_submit_trigger" value="Please wait while redirecting to PayPal" />';
    
    post_vars.each {|key, value|
        paypal_form += "<input type='hidden' name='#{key}' value='#{value}' />";
    }
    
    paypal_form += item_hidden_field
    
    paypal_form += '</form></div>';
    paypal_form += '<script type="text/javascript">';
    paypal_form += 'document.getElementById( "paypal_submit_trigger" ).click();';
    paypal_form += '</script>';
    paypal_form += '</body></html>';
    render text: paypal_form and return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :cart_number, :cart_total, :ip_address)
    end
end
