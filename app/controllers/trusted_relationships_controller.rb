class TrustedRelationshipsController < ApplicationController
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
    the_trusted_relationship.brand_id = params.fetch("query_brand_id")

    if the_trusted_relationship.valid?
      the_trusted_relationship.save
      redirect_to("/trusted_relationships", { :notice => "Trusted relationship created successfully." })
    else
      redirect_to("/trusted_relationships", { :alert => the_trusted_relationship.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trusted_relationship = TrustedRelationship.where({ :id => the_id }).at(0)

    the_trusted_relationship.user_id = params.fetch("query_user_id")
    the_trusted_relationship.brand_id = params.fetch("query_brand_id")

    if the_trusted_relationship.valid?
      the_trusted_relationship.save
      redirect_to("/trusted_relationships/#{the_trusted_relationship.id}", { :notice => "Trusted relationship updated successfully."} )
    else
      redirect_to("/trusted_relationships/#{the_trusted_relationship.id}", { :alert => the_trusted_relationship.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trusted_relationship = TrustedRelationship.where({ :id => the_id }).at(0)

    the_trusted_relationship.destroy

    redirect_to("/trusted_relationships", { :notice => "Trusted relationship deleted successfully."} )
  end
end
