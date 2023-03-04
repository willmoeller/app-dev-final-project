# == Schema Information
#
# Table name: trusted_relationships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :integer
#  user_id    :integer
#
class TrustedRelationship < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:brand, { :required => true, :class_name => "Company", :foreign_key => "brand_id" })
end
