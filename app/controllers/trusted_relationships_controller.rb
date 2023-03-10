class TrustedRelationshipsController < ApplicationController
  def show_user_companies
    @relationships = TrustedRelationship.where({ :user_id => @current_user.id })
    render({ :template => "users/user_companies.html.erb" })
  end

  def show_company_to_users
    company_id = params.fetch("path_id")
    @company = Company.where({ :id => company_id }).first
    render({ :template => "trusted_relationships/show_company.html.erb" })
  end

  def show_company_users
    @relationships = TrustedRelationship.where({ :company_id => @current_company.id })
    render({ :template => "companies/company_users.html.erb" })
  end

  def show_user_to_companies
    user_id = params.fetch("path_id")
    @user = User.where({ :id => user_id }).first
    render({ :template => "trusted_relationships/show_user.html.erb" })
  end

  # --- not used

  def index
    matching_trusted_relationships = TrustedRelationship.all

    @list_of_trusted_relationships = matching_trusted_relationships.order({ :created_at => :desc })

    render({ :template => "trusted_relationships/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trusted_relationships = TrustedRelationship.where({ :id => the_id })

    @the_trusted_relationship = matching_trusted_relationships.at(0)

    render({ :template => "trusted_relationships/show.html.erb" })
  end

  def create
    the_trusted_relationship = TrustedRelationship.new
    the_trusted_relationship.user_id = params.fetch("query_user_id")
    the_trusted_relationship.company_id = params.fetch("query_company_id")

    if the_trusted_relationship.valid?
      the_trusted_relationship.save
      redirect_to("/user_companies", { :notice => "Trusted relationship created successfully." })
    else
      redirect_to("/user_companies", { :alert => the_trusted_relationship.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trusted_relationship = TrustedRelationship.where({ :id => the_id }).at(0)

    the_trusted_relationship.user_id = params.fetch("query_user_id")
    the_trusted_relationship.company_id = params.fetch("query_company_id")

    if the_trusted_relationship.valid?
      the_trusted_relationship.save
      redirect_to("/trusted_relationships/#{the_trusted_relationship.id}", { :notice => "Trusted relationship updated successfully." })
    else
      redirect_to("/trusted_relationships/#{the_trusted_relationship.id}", { :alert => the_trusted_relationship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trusted_relationship = TrustedRelationship.where({ :id => the_id }).at(0)
    the_trusted_relationship.destroy

    redirect_to("/user_companies", { :notice => "Relationship deleted successfully." })
  end
end
