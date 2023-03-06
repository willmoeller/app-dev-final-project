class UsersController < ApplicationController
  def dashboard
    render({ :template => "/users/dashboard.html.erb" })
  end

  def preferences
    render({ :template => "/users/preferences.html.erb" })
  end

  def update_preferences
    user = @current_user
    if params.has_key?(:email)
      email = params.fetch("email")
    end

    redirect_to("/user_preferences")
    # render({ :template => "/users/preferences.html.erb" })

    # first_name = params.fetch("first_name")
    # last_name = params.fetch("last_name")
    # date_of_birth = params.fetch("date_of_birth")
    # address = params.fetch("address")

  end

  def show_profile
    @user = @current_user
    render({ :template => "users/show_profile.html.erb" })
  end

  def edit_profile_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update_profile
    @user = @current_user
    @user.email = params.fetch("query_email")
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
      render({ :template => "users/edit_profile_with_errors.html.erb", :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def edit_password_form
    render({ :template => "/user_authentication/edit_password.html.erb" })
  end

  def update_password
    @user = @current_user
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")

    if @user.valid?
      @user.save
      redirect_to("/user_dashboard", { :notice => "Password updated successfully." })
    else
      render({ :template => "users/edit_password_with_errors.html.erb", :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy_account
    @current_user.destroy
    reset_session
    redirect_to("/", { :notice => "Your account was successfully deleted." })
  end
end
