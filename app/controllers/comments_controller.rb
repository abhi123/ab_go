class CommentsController < ApplicationController
  
def create
  @comment = Comment.create(params[:comment])
  @comment.save
  respond_to do |format|
    if @comment.save
      format.html { redirect_to(:controller => "posts", :action => "show", :id => params[:comment][:post_id]) }
    else
      format.html { render :action => 'new' }
    end
  end
end

end
