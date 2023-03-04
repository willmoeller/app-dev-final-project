# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Company < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
