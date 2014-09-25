class PagesController < ApplicationController
  helper ApplicationHelper
  
  #before_filter :authenticate_user! , :only => [:artisthome, :fanhome]
  
  def home    
  end
  #added by sam 
  def genres
    allowedResultTypes = ["video","music"]
    @search = params[:search].to_s
    @cat_id = params[:cat_id].to_s
    @uploaded_time = params[:uploaded_time].to_s
    @result_type = params[:result_type].to_s
    if @result_type == ""
      @result_type = "video"
    end
    @duration = params[:duration].to_s
    @quality = params[:quality].to_s
    @sort_by = params[:sort_by].to_s
    if @sort_by == ""
      @sort_by = "upload-date"
    end
    @musicCategories = MusicCategory.all()
    time = Time.new
    
    
    
    @results = []
    base_table_name = "videos"
    if allowedResultTypes.include?(@result_type)
      if @result_type == "video"
        results = Video.where("published=1")
        if @cat_id != ''
          results = results.joins('INNER JOIN music_categories_videos ON music_categories_videos.video_id = videos.id')
          results = results.where("music_categories_videos.music_category_id=?",@cat_id)
        end
      elsif @result_type == "music"
        base_table_name = "audios"
        results = Audio.where("published=1")
        if @cat_id != ''
          results = results.joins('INNER JOIN audios_music_categories ON audios_music_categories.audio_id = audios.id')
          results = results.where("audios_music_categories.music_category_id=?",@cat_id)
        end
      end
      
      
      if @search != ""
        search_str = '%'+@search+'%'
        results = results.where("title LIKE ? OR `desc` LIKE ?",search_str,search_str)        
      end
      
      
      
      if @duration == '4-mins'
      elsif @duration == '20-mins'
        
      end
      
      if @uploaded_time == 'last_hour'      
        results = results.where("HOUR(TIMEDIFF(NOW(), "+base_table_name+".created_at))  <= ?",1)
      elsif @uploaded_time == 'today'        
        results = results.where("DATE("+base_table_name+".created_at)  = ?",time.strftime("%Y-%m-%d"))
      elsif @uploaded_time == 'this-week'
        results = results.where("WEEK("+base_table_name+".created_at)  = WEEK(NOW())")
      elsif @uploaded_time == 'this-month'
        results = results.where("MONTH("+base_table_name+".created_at)  = MONTH(NOW())")
      elsif @uploaded_time == 'this-year'
        results = results.where("YEAR("+base_table_name+".created_at)  = YEAR(NOW())")
      end
      if @sort_by == "upload-date"
        @results = results.order(base_table_name+'.created_at DESC').paginate(:page => params[:page], :per_page => 10)
      elsif @sort_by == "view-count"
        @results = results.order(base_table_name+'.hits DESC').paginate(:page => params[:page], :per_page => 10)
      end
      
    end
    
  end
  
  def signup    
  end
  #added by sam 
  def dashboard
    request_id = params[:id]
    @isMine = false
    if request_id == nil            
      redirect_to('/') and return
    else
      @displayUser = User.find(request_id)
      if @displayUser == nil
        redirect_to('/') and return        
      end
      
      if (current_user != nil && current_user.id == request_id) #not logged in
        @isMine = true
      end    
    end
    
    #country state ...
    if @displayUser.country_id != nil
      country = Country.find(@displayUser.country_id)
    else
      country = nil
    end
    
    if @displayUser.state_id != nil
      state = State.find(@displayUser.state_id)
    else
      state = nil
    end
    
    
    if country == nil
      @countryName = ""
    else
      @countryName = country.country_name
    end
    if state == nil
      @stateName = ""
    else
      @stateName = state.state_name
    end
    #country state ...
    if @displayUser.user_type == 'fan'
      
      render "fanhome"
    else
      @becomeFanLink = "javascript:void(0);"
      @artist_id = request_id.to_i
      
      @fanFriends = Array.new
      if (current_user != nil) && current_user.user_type == "fan" && !@isMine
          @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:current_user.id);
                
      elsif current_user!=nil
        @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:current_user.id);
      else
        @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:0);
      end
      #audioList = Audio.where("user_id = ? AND published=1",request_id).order('created_at DESC')
      
      ## genre categories will be video categories, not audio categories
      @myMusicCategories = []
      myAudioIds = Video.where("user_id = ?",request_id).select(:id).distinct.order('created_at DESC')
      if myAudioIds.length > 0        
        myAudioIdsStr = ""
        myAudioIds.each do |row|
            if myAudioIdsStr.blank?
              myAudioIdsStr = row.id.to_s
            else            
              myAudioIdsStr = myAudioIdsStr + "," + row.id.to_s            
            end
        end
        
        myMusicCategoryIds = MusicCategoriesVideos.where(:video_id => myAudioIdsStr.split(',').map(&:to_i)).select(:music_category_id).distinct
        #render text: AudiosMusicCategories.where(:audio_id => myAudioIdsStr.split(',').map(&:to_i)).select(:music_category_id).distinct.to_sql() and return
        if myMusicCategoryIds!=nil
          myCatIdsStr = ""
          myMusicCategoryIds.each do |row|
              if myCatIdsStr.blank?
                myCatIdsStr = row.music_category_id.to_s
              else            
                myCatIdsStr = myCatIdsStr + "," + row.music_category_id.to_s            
              end
          end
          @myMusicCategories = MusicCategory.where(:id => myCatIdsStr.split(',').map(&:to_i))      
        end
      end
      
      
      #@myMusicCategories = MusicCategory.where("music_categories.id IN(SELECT music_category_rels.music_category_id FROM music_category_rels WHERE music_category_rels.audio_id IN(SELECT audios.id FROM audios WHERE user_id=?))",@artist_id)      
      render "artisthome"
    end
    
  end
  
  #added by sam 
  def artist_fantistics
    request_id = params[:artist_id]
    @isMine = false
    if request_id == nil            
      redirect_to('/') and return
    else
      @displayUser = User.find(request_id);
      if @displayUser == nil
        redirect_to('/') and return        
      end
      
      if (current_user != nil && current_user.id == request_id) #not logged in
        @isMine = true
      end    
    end
    
    #country state ...
    if @displayUser.country_id != nil
      country = Country.find(@displayUser.country_id)
    else
      country = nil
    end
    
    if @displayUser.state_id != nil
      state = State.find(@displayUser.state_id)
    else
      state = nil
    end
    
    
    if country == nil
      @countryName = ""
    else
      @countryName = country.country_name
    end
    if state == nil
      @stateName = ""
    else
      @stateName = state.state_name
    end
    #country state ...
    
    if @displayUser.user_type == 'artist'
      @becomeFanLink = "javascript:void(0);"
      @artist_id = request_id.to_i;
      
      @fanFriends = Array.new
      if (current_user != nil) && current_user.user_type == "fan" && !@isMine
          @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:current_user.id);
                
      elsif current_user!=nil
        @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:current_user.id);
      else
        @becomeFanLink = become_fan_path(artistid: @artist_id,fanid:0);
      end
    else
      redirect_to (root_path) and return
    end
    
  end
  
  #added by sam 
  def become_fan
    artistid = params[:artistid]
    fanid = params[:fanid]
    
    if current_user == nil
      flash[:alert] = "You need to login to see this page."
      redirect_to(new_user_session_path) and return
    end
    
    #artistUser = User.where("id = ? AND user_type = 'artist'",artistid).take    
    artistUser = User.where("id = ?",artistid).take    
    fanUser = User.where("id = ?",fanid).take
    artistUserName = artistUser.first_name+' '+artistUser.last_name
    
    if (artistUser == nil || fanUser == nil)
      flash[:alert] = "Sorry, you can't become fan of this user."
      redirect_to(artist_dashboard_path(id: artistUser.id.to_s+':'+artistUserName.parameterize)) and return
    elsif artistUser.user_type != 'artist'
      flash[:alert] = "Sorry, This user is not an artist."
      redirect_to(artist_dashboard_path(id: artistUser.id.to_s+':'+artistUserName.parameterize)) and return    
    elsif artistUser.id == current_user.id
      flash[:alert] = "Sorry, You can't become fan of your own."
      redirect_to(artist_dashboard_path(id: artistUser.id.to_s+':'+artistUserName.parameterize)) and return
    else
      #check of already friend
      isFriendCount = User.find_by_sql ["SELECT COUNT(*) AS total FROM artist_fans WHERE artist_id = ? AND fan_id = ?",artistid,fanid]
      if isFriendCount[0].total > 0
        flash[:alert] = "You have already added this artist."
        redirect_to(artist_dashboard_path(id: artistUser.id.to_s+':'+artistUserName.parameterize)) and return
      else
        #insert into artist fans
      end
      time = Time.new
      createdTime = time.strftime("%Y-%m-%d")
      insert_sql = "INSERT INTO artist_fans(artist_id,fan_id,created_at,status) VALUES(#{artistid},#{fanid},'"+createdTime+"',1)"
      User.connection.insert(insert_sql);
      flash[:notice] = "You have successfully become a fan of "+artistUser.first_name+" "+artistUser.last_name+"."
      redirect_to( artist_dashboard_path(id: artistUser.id.to_s+':'+artistUserName.parameterize)) and return
    end
    
  end
  
  #added by sam 
  def renew_subscription
    @subscription_id = params[:subscription_id]
    if @subscription_id == nil
      redirect_to('/') and return
    end
    @subscriptionRow = Subscription.find(@subscription_id)
    time = Time.new
    #if !((@subscriptionRow.status!="Active") || (!@subscriptionRow.lifetime && (@subscriptionRow.expiration.to_time.utc < time.strftime("%Y-%m-%d %H:%M:%S"))))
      #redirect_to('/') and return
    #end
    
    ## detect current user assigned plan
    @user_assgined = 0
    if current_user != nil
      subscription = Subscription.find_by userid: current_user.id
      @user_assgined = subscription.plan
    end
    
    @plans = Plan.where("published=1").order('ordering ASC')
    
  end
  #added by sam 
  def confirmation_subscription
    @subscription_id = params[:subscription_id]
    @plan_id = params[:plan_id]
    @subscriptionRow = Subscription.find(@subscription_id)
    @plan = Plan.where("published=1 AND id=?",@plan_id).take
    if @plan==nil
      redirect_to('/') and return
    end
    time = Time.new
    
    #if !((@subscriptionRow.status!="Active") || (!@subscriptionRow.lifetime && (@subscriptionRow.expiration.to_time.utc < time.strftime("%Y-%m-%d %H:%M:%S"))))#did not expire
      #redirect_to('/') and return
    #end
  end
  
  #added by sam 
  def subscription_confirmed
    @subscription_id = params[:subscription_id]
    @plan_id = params[:plan_id]
    @plan = Plan.where("published=1 AND id=?",@plan_id).take
    if @plan==nil
      redirect_to('/') and return
    end
    time = Time.new
    @subscription = Subscription.find(@subscription_id)
    #if ((@subscription.status!="Active") || (!@subscription.lifetime && (@subscription.expiration.to_time.utc < time.strftime("%Y-%m-%d %H:%M:%S"))))#did not expire
      #redirect_to('/') and return
    #end
    
    @subscriber = User.find(@subscription.userid)
    if !@plan.is_free
      @invoice = Invoice.new
      @invoice.userid = @subscription.userid
      @invoice.subscr_id = @subscription_id
      @invoice.active = 0
      @invoice.invoice_number = SecureRandom.uuid
      @invoice.created_date = Time.now.to_datetime.utc
      @invoice.used_plan = @plan_id
      @invoice.method = 'paypal'
      @invoice.amount = @plan.price
      @invoice.currency = 'USD'      
      @invoice.save
      
      
      if (!@subscription.lifetime && (@subscription.expiration.to_time.utc < time.strftime("%Y-%m-%d %H:%M:%S")) )
        @subscription.status = "Pending"        
        @subscription.save
      end
      
      # redirect to paypal
      settings = Settings.find(1);
      paypal_url = settings.sandbox ? "https://www.sandbox.paypal.com/cgi-bin/webscr" : "https://www.paypal.com/cgi-bin/webscr"
      merchant_email = settings.sandbox ? settings.sandbox_merchant_email : settings.paypal_merchant_email 
      currency_3_code = settings.currency 
      
      post_vars = {
            :cmd => '_ext-enter',
            :redirect_cmd => '_xclick',
            :business => merchant_email, #Email address or account ID of the payment recipient (i.e., the merchant).
            :receiver_email => merchant_email, #Primary email address of the payment recipient (i.e., the merchant
            :order_number => @invoice.invoice_number,
            :invoice => @invoice.invoice_number,
            :custom => Base64.encode64("#{@subscriber.email}|#{@subscriber.encrypted_password}"),
            :item_name => "Artist Subscription - #{@plan.name}",
            :amount => @plan.price,
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
      paypal_form += '</form></div>';
      paypal_form += '<script type="text/javascript">';
      paypal_form += 'document.getElementById( "paypal_submit_trigger" ).click();';
      paypal_form += '</script>';
      paypal_form += '</body></html>';
      
      render text: paypal_form and return
    else
      #update the subscription to free
      
      @invoice = Invoice.new
      @invoice.userid = @subscription.userid
      @invoice.subscr_id = @subscription_id
      @invoice.active = 1
      @invoice.invoice_number = SecureRandom.uuid
      @invoice.created_date = Time.now.to_datetime.utc
      @invoice.used_plan = @plan_id
      @invoice.method = 'paypal'
      @invoice.amount = 0
      @invoice.currency = 'USD'      
      @invoice.save
      
      @subscription.plan = @plan_id
      @subscription.status = "Active"
      last_expiration = DateTime.parse(Time.now.to_datetime.utc.to_s)      
      @subscription.expiration = last_expiration.advance(months:1).to_datetime
      @subscription.save
      
      flash[:notice] = "You have successfully subscribed as "+@plan.name.to_s+" member."
      redirect_to new_user_session_path and return
    end
  end
  
  def pending_invoice
    @subscription_id = params[:subscription_id]
    
    @subscriptionRow = Subscription.where("id=? AND status='Pending'",@subscription_id).take
    if @subscriptionRow!=nil
      @plan = Plan.where("published=1 AND id=?",@subscriptionRow.plan).take      
      @lastInvoice = Invoice.where("subscr_id=?",@subscriptionRow.id).order('id DESC').take
      if @lastInvoice!=nil && !@lastInvoice.active
        @plan = Plan.where("published=1 AND id=?",@lastInvoice.used_plan).take      
        @subscriber = User.find(@subscriptionRow.userid)
        # redirect to paypal        
      else
        redirect_to('/') and return
      end
    else
      redirect_to('/') and return
    end    
  end
  
  def confirm_pending_invoice
    @subscription_id = params[:subscription_id]
    
    @subscriptionRow = Subscription.where("id=? AND status='Pending'",@subscription_id).take
    if @subscriptionRow!=nil
      @plan = Plan.where("published=1 AND id=?",@subscriptionRow.plan).take      
      @lastInvoice = Invoice.where("subscr_id=?",@subscriptionRow.id).order('id DESC').take
      if @lastInvoice!=nil && !@lastInvoice.active
        @plan = Plan.where("published=1 AND id=?",@lastInvoice.used_plan).take    
        @subscriber = User.find(@subscriptionRow.userid)
        # redirect to paypal
        settings = Settings.find(1);
        paypal_url = settings.sandbox ? "https://www.sandbox.paypal.com/cgi-bin/webscr" : "https://www.paypal.com/cgi-bin/webscr"
        merchant_email = settings.sandbox ? settings.sandbox_merchant_email : settings.paypal_merchant_email 
        currency_3_code = settings.currency
        post_vars = {
              :cmd => '_ext-enter',
              :redirect_cmd => '_xclick',
              :business => merchant_email, #Email address or account ID of the payment recipient (i.e., the merchant).
              :receiver_email => merchant_email, #Primary email address of the payment recipient (i.e., the merchant
              :order_number => @lastInvoice.invoice_number,
              :invoice => @lastInvoice.invoice_number,
              :custom => Base64.encode64("#{@subscriber.email}|#{@subscriber.encrypted_password}"),
              :item_name => "Artist Subscription - #{@plan.name}",
              :amount => @plan.price,
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
        paypal_form += '</form></div>';
        paypal_form += '<script type="text/javascript">';
        paypal_form += 'document.getElementById( "paypal_submit_trigger" ).click();';
        paypal_form += '</script>';
        paypal_form += '</body></html>';
        render text: paypal_form and return
      else
        redirect_to('/') and return
      end
    else
      redirect_to('/') and return
    end    
  end
  
  def content_page
    content_alias = params[:alias]
    @content = Content.where('alias = ? AND published = 1', content_alias).take
    
    if @content==nil
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    else
      # update hits
      @content.update_attributes(:hits => @content.hits.to_i + 1)
    end
  end
  
  def download_music
    if current_user != nil      
      orderItemRow = OrderItem.where("unique_key=? AND user_id=?",params[:unqiue_key],current_user.id).take
      if orderItemRow != nil && orderItemRow.order_status.to_i == 1
        audioFile = Audio.where("id=? AND published=1",orderItemRow.product_id).take
        if audioFile != nil && audioFile.is_downloadable
          send_file "public"+audioFile.path.to_s, :type => 'audio/mpeg3', :filename => audioFile.title+".mp3"
        elsif audioFile != nil && !audioFile.is_downloadable
          flash[:alert] = "File is not downloadable."
          redirect_to('/') and return
        else
          flash[:alert] = "File not found."
          redirect_to('/') and return
        end
      elsif orderItemRow != nil && orderItemRow.order_status.to_i == 0
        flash[:alert] = "Order is not completed yet."
        redirect_to('/') and return
      else
        flash[:alert] = "Order not found."
        redirect_to('/') and return
      end
    else
      flash[:alert] = "Please login to download music."
      redirect_to(new_user_session_path) and return
    end
  end
  
  def download_free_music
    if !current_user.nil?
      audio_id = params[:id]
      audioFile = Audio.where("id=? AND published=1",audio_id).take
      if audioFile != nil && audioFile.is_downloadable
        send_file "public"+audioFile.path.to_s, :type => 'audio/mpeg3', :filename => audioFile.title+".mp3"
      elsif audioFile != nil && !audioFile.is_downloadable
        flash[:alert] = "File is not downloadable."
        redirect_to('/') and return
      else
        flash[:alert] = "File not found."
        redirect_to('/') and return
      end
    else
      flash[:alert] = "Please login to download music."
      redirect_to(new_user_session_path) and return
    end    
  end
  
  def readnews
    @news = AdminNews.find(params[:id])
    # update hits
    @news.update_attributes(:hits => @news.hits.to_i + 1)
  end  
  def fanregister
  end 

end
