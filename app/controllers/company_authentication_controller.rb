class CompanyAuthenticationController < ApplicationController
  def company_sign_up_form
    render({ :template => "company_authentication/company_sign_up.html.erb" })
  end

  def create_company
    @company = Company.new
    @company.name = params.fetch("query_company_name")
    @company.password = params.fetch("query_password")
    @company.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @company.save

    if save_status == true
      session[:company_id] = @company.id

      redirect_to("/companies/company_dashboard", { :notice => "Company account created successfully." })
    else
      redirect_to("/user_sign_up", { :alert => @company.errors.full_messages.to_sentence })
    end
  end

  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first

    the_supplied_password = params.fetch("query_password")

    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)

      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id

        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def show
    @user = @current_user
    render({ :template => "user_authentication/show_profile.html.erb" })
  end

  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.date_of_birth = params.fetch("query_date_of_birth")
    @user.street_address = params.fetch("query_street_address")
    @user.apartment_number = params.fetch("query_apartment_number")
    @user.city = params.fetch("query_city")
    @user.state = params.fetch("query_state")
    @user.zip_code = params.fetch("query_zip_code")

    if @user.valid?
      @user.save

      redirect_to("/show_user_profile", { :notice => "User account updated successfully." })
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb", :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_user.destroy
    reset_session

    redirect_to("/", { :notice => "User account cancelled" })
  end
end
