desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  # Add user data
  User.destroy_all # start fresh
  50.times do
    user = User.new
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    user.first_name = first_name
    user.last_name = last_name
    user.email = first_name.downcase + last_name.downcase + "@example.com"
    user.password = "password" # password can't be blank, otherwise task won't work
    user.date_of_birth = Faker::Date.between(from: "1923-01-01", to: "2005-01-01")
    user.street_address = Faker::Address.street_address
    user.apartment_number = Faker::Address.secondary_address
    user.city = Faker::Address.city
    user.state = Faker::Address.state_abbr
    user.zip_code = Faker::Address.zip_code
    user.save
  end

  # Add Company data
  Company.destroy_all # start fresh
  50.times do
    company = Company.new
    name = Faker::Company.name
    company.name = name
    company.email = "admin@" + name.delete(" ").delete(",").delete("'").downcase + ".com"
    company.password = "password" # password can't be blank, otherwise task won't work
    company.website = "https://" + name.delete(" ").delete(",").delete("'").downcase + ".com"
    company.save
  end

  # Create Trusted Relationships between Users and Companies
  100.times do
    relationship = TrustedRelationship.new
    user = User.all.sample # Find a random user
    company = Company.all.sample # Find a random company
    relationship.user_id = user.id
    relationship.company_id = company.id
    relationship.save
  end

  p "Added #{User.count} users."
  p "Added #{Company.count} companies."
  p "Added #{TrustedRelationship.count} relationships."
end
