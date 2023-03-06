# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  apartment_number    :string
#  auth_token          :string
#  city                :string
#  date_of_birth       :date
#  email               :string
#  first_name          :string
#  last_name           :string
#  password_digest     :string
#  share_address       :boolean
#  share_date_of_birth :boolean
#  share_email         :boolean
#  share_first_name    :boolean
#  share_last_name     :boolean
#  state               :string
#  street_address      :string
#  verified            :boolean
#  zip_code            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:trusted_relationships, { :class_name => "TrustedRelationship", :foreign_key => "user_id" })
  has_many(:trusted_companies, { :through => :trusted_relationships, :source => :company })
end
