desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  User.destroy_all
  Brand.destroy_all

  50.times do
    user = User.new
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    user.first_name = first_name
    user.last_name = last_name
    user.email = first_name + last_name + "@example.com"
    user.password = "password" # password can't be blank, otherwise task won't work
    user.date_of_birth = Faker::Date.between(from: "1923-01-01", to: "2005-01-01")
    user.street_address = Faker::Address.street_address
    user.apartment_number = Faker::Address.secondary_address
    user.city = Faker::Address.city
    user.state = Faker::Address.state_abbr
    user.zip_code = Faker::Address.zip_code
    user.save
  end

  brands = [
    {
      :name => "Lululemon",
      :website => "https://shop.lululemon.com/",
    },
    {
      :name => "Target",
      :website => "https://www.target.com/",
    },
  ]

  brands.each do |brand|
    brand = Brand.new
    brand.name = brand.fetch(:name)
    brand.website = brand.fetch(:website)
    brand.save
  end

  p "Added #{User.count} users"
  p "Added #{Brand.count} brands"
end
