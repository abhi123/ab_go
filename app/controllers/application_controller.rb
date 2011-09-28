class ApplicationController < ActionController::Base
  #include Authentication
  before_filter :require_login
  around_filter :catch_exceptions
  protect_from_forgery

  rescue_from FbGraph::Exception, :with => :fb_graph_exception

  def fb_graph_exception(e)
    flash[:error] = {
      :title   => e.class,
      :message => e.message
    }
    current_user.try(:destroy)
    redirect_to root_url
  end
  
  def after_sign_in_path_for(resource_or_scope)
    locals_path
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section" 
      redirect_to root_path # Prevents the current action from running
    end
  end

  # The logged_in? method simply returns true if the user is logged in and
  # false otherwise. It does this by "booleanizing" the current_user method
  # we created previously using a double ! operator. Note that this is not
  # common in Ruby and is discouraged unless you really mean to convert something
  # into true or false.
  def logged_in?
    !!current_user
  end
  
  def catch_exceptions
    yield
  rescue => exception
    logger.debug "Caught exception! #{exception}" 
    raise
  end
end
