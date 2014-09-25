class CommentsController < ApplicationController  
  before_filter :authenticate_user!  
  protect_from_forgery except: :create

  # POST /plans
  # POST /plans.json
  def create
    comment_vars = {
            :body => comment_params[:body],
            :video_id => comment_params[:video_id],
            :user_id => current_user.id,
            :commented_by_name=> current_user.first_name.to_s+" "+current_user.last_name.to_s
      }
    @comment = Comment.new(comment_vars)

    respond_to do |format|
      if @comment.save
        flash[:notice] = "Comment successfully created."
        redirect_to(watch_video_path(:id=>comment_params[:video_id])) and return
      else
        flash[:notice] = "Comment creation failed."
        redirect_to(watch_video_path(:id=>comment_params[:video_id])) and return
      end
    end
  end

  

  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :video_id)
    end
    
end
