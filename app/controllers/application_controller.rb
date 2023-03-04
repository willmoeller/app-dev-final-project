class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  before_action(:load_current_company)
  # Uncomment line 5 below and line 3 in CompanyAuthenticationController if you want to force companies to sign in before any other actions.
  # before_action(:force_company_sign_in)
  # Uncomment line 7 below file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)

  # Actions to load current company
  def load_current_company
    the_id = session[:company_id]
    @current_company = Company.where({ :id => the_id }).first
  end

  def force_company_sign_in
    if @current_company == nil
      redirect_to("/company_sign_in", { :notice => "You have to sign in first." })
    end
  end

  # Actions to load current user
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end

  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  # Actions for site navigation
  def index
    render({ :template => "index.html.erb" })
  end

  def dashboard
    render({ :template => "dashboard.html.erb" })
  end

  def sign_up
    render({ :template => "sign_up.html.erb" })
  end

  def sign_in
    render({ :template => "sign_in.html.erb" })
  end
end
