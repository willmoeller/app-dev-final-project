class CompanyController < ApplicationController
  def dashboard
    render({ :template => "/companies/dashboard.html.erb" })
  end

  def show_profile
    @company = @current_company
    render({ :template => "companies/show_profile.html.erb" })
  end

  def edit_profile_form
    render({ :template => "companies/edit_profile.html.erb" })
  end

  def update_profile
    @company = @current_company
    @company.email = params.fetch("query_email")
    @company.name = params.fetch("query_name")
    @company.website = params.fetch("query_website")

    if @company.valid?
      @company.save
      redirect_to("/show_company_profile", { :notice => "Company account updated successfully." })
    else
      render({ :template => "company_authentication/edit_profile_with_errors.html.erb", :alert => @company.errors.full_messages.to_sentence })
    end
  end

  def edit_password_form
    render({ :template => "/companies/edit_password.html.erb" })
  end

  def update_password
    @company = @current_company
    @company.password = params.fetch("query_password")
    @company.password_confirmation = params.fetch("query_password_confirmation")

    if @company.valid?
      @company.save
      redirect_to("/company_dashboard", { :notice => "Password updated successfully." })
    else
      render({ :template => "companies/edit_password_with_errors.html.erb", :alert => @company.errors.full_messages.to_sentence })
    end
  end

  def destroy_account
    @current_company.destroy
    reset_session
    redirect_to("/", { :notice => "Your account was successfully deleted." })
  end
end
