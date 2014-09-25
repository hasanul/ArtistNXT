class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create, :confirm_music_purchase]

  def create
    puts request.env['REMOTE_ADDR']
    
    #require 'socket'
    #hostinfo = Socket.gethostbyname('www.paypal.com')
    #puts hostinfo[1]

    invoice_number = params[:invoice]
    mc_gross = params[:mc_gross]
    mc_currency = params[:mc_currency]
    payment_status = params[:payment_status]
    
    ## fraud check
    
    
    ## invoice existence check
    if invoice_number==nil
      render text: "Invoice not exists" and return
    end
    
    invoice_obj = Invoice.where('invoice_number = ?', invoice_number).take
    
    ## invoice usage check
    if invoice_obj.active
      render text: "Invoice already used" and return
    end
    
    ## amount and currency check
    if invoice_obj.amount.to_d > mc_gross.to_d || invoice_obj.currency != mc_currency
      render text: "Amount Currency mismatch" and return
    end
    
    ## update subscription and invoice if payment status is completed
    if payment_status == 'Completed'
      
      invoice_obj.update_attributes(:active => 1,
                                    :transaction_date => Time.now.to_datetime.utc
                                    )
      
      subscr_id = invoice_obj.subscr_id
      subscription_obj = Subscription.find(subscr_id)
      last_expiration = DateTime.parse(subscription_obj.expiration.to_s)
      
      subscription_obj.update_attributes(:status => 'Active',
                                          :plan => invoice_obj.used_plan,
                                          :expiration => last_expiration.advance(months:1).to_datetime
                                        )
      userObj = User.find(subscription_obj.userid)
      UsersMailer.payment_complete_message(userObj).deliver
    end
    
    render :nothing => true
  end
  
  
  def confirm_music_purchase
    
    #require 'socket'
    #hostinfo = Socket.gethostbyname('www.paypal.com')
    #puts hostinfo[1]
    
    
    
    #uri = URI.parse('https://www.paypal.com/webscr?cmd=_notify-validate')

    #http = Net::HTTP.new(uri.host, uri.port)
    #http.open_timeout = 60
    #http.read_timeout = 60
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #http.use_ssl = true
    #response = http.post(uri.request_uri, request.raw_post,
    #                     'Content-Length' => "#{request.raw_post.size}",
    #                     'User-Agent' => request.user_agent
    #                   ).body
    
    #render text: response and return

    invoice_number = params[:invoice]
    mc_gross = params[:mc_gross]
    mc_currency = params[:mc_currency]
    payment_status = params[:payment_status]
    
    ## fraud check
    
    
    ## invoice existence check
    if invoice_number==nil
      render text: "Invoice not exists" and return
    end
    
    order_obj = Order.where('order_number = ?', invoice_number).take
    if order_obj != nil
      ## invoice usage check
      
      if order_obj.order_status == 1
        render text: "Invoice already used" and return
      end
      
      ## amount and currency check
      if order_obj.order_total.to_d > mc_gross.to_d || order_obj.order_currency != mc_currency
        render text: "Amount Currency mismatch" and return
      end
      
      ## update subscription and invoice if payment status is completed
      if payment_status == 'Completed'
        
        musicList = []
        
        order_obj.update_attributes(:order_status => 1)
        order_obj.order_items.each do |item|
          item.update_attributes(:order_status => 1)
          
          musicRow = Audio.where("id = ?",item.product_id).take
          if musicRow != nil
            downloadObj = {
              :title => musicRow.title,
              :download_key => item.unique_key
            }
            musicList.push(downloadObj)                  
          end
        end
        userObj = User.find(order_obj.user_id)
        UsersMailer.music_purchase_completed(userObj,musicList).deliver
      end
    end
    
    
    render :nothing => true
  end

end