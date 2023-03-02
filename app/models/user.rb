# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  apartment_number :string
#  auth_token       :string
#  city             :string
#  date_of_birth    :date
#  email            :string
#  first_name       :string
#  last_name        :string
#  password_digest  :string
#  state            :string
#  street_address   :string
#  verified         :boolean
#  zip_code         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
