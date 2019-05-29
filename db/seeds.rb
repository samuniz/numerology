require 'faker'

(1..40).each do |i|
    Person.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, birthdate: Faker::Date.between(80.years.ago, 18.years.ago))
  end