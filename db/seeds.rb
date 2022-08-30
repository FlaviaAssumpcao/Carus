# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Nonprofit.destroy_all
User.destroy_all
TimeCategory.destroy_all
GoodsCategory.destroy_all
GoodsCategorization.destroy_all
TimeCategorization.destroy_all


puts "Creating users..."
user_1 = {
  first_name: "Paul",
  last_name: "Domingos",
  date_of_birth: "1980-05-22",
  email: "paul.domingos@gmail.com",
  password: 123456
}
user_2 = {
  first_name: "Joana",
  last_name: "Figueira",
  email: "joana.figueira@gmail.com",
  date_of_birth: "1982-08-22",
  password: 123456
}

[user_1, user_2].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end



puts "Creating nonprofits..."
ventos_ativos = {
  name: "Associacao Ventos Ativos"
  brief_description: "A nonprofit organization aiming the protection of the youth through sports, dance and art",
  address: "Alto do Varejao, Lisboa",
  phone: "212 324 543",
  city: "Lisboa",
  full_description: "Through sports, dance and art the Associacao Portuguesa Pro-Juventude provide activities, workshop and regular training through the selection of commited young kids",
  min_time:,
  max_time: ,
}
barriga_cheia = {
  name: "Associacao Barriga Cheia",
  brief_description: "A nonprofit organization collecting and distributing food for the people in need",
  address: "Rua do Conde de Redondo 91B, Lisboa",
  phone: "212 100 200",
  city: "Lisboa",
  full_description: "The Associacao Barriga Cheia collects, organizes and distributes food on different locations on a weekly basis for the people in need. ",
  min_time:,
  max_time: ,
}
pro_juventude  = {
  name: "Grupo Pro-juventude",
  brief_description: "A nonprofit organization - entertainment",
  address: "Alto do Varejao, Lisboa",
  phone: "212 324 543",
  city: "Lisboa",
  full_description: "Through sports, dance and art the Associacao Portuguesa Pro-Juventude provide activities, workshop and regular training through the selection of commited young kids",
}
longevidade = {
  name: "Associacao de Apoio a Longevidade",
  brief_description: "A nonprofit organization looking after the older adults",
  address: "Avenida Madame Curie, 18, Lisboa",
  phone: "216 000 222",
  city: "Lisboa",
  full_description: "The Associacao de Apoio a Longevidade invest all its effort on the wellbeing of its guests. It provides basic care and entertainment to the older adults",
  min_time: 10,
  max_time: 14,
}


[ventos_ativos, barriga_cheia, pro_juventude, longevidade].each do |attributes|
  nonprofit = Nonprofit.create(attributes)
  # file = URI.open(attributes[:url])
  # experience.photo.attach(io: file, filename: "experience.jpg", content_type: "image/jpg")
  # experience.save

  puts "Created #{nonprofit.name}"
end


puts "Creating goods categories..."
goods_category_food = {
  name: "Food",
}

goods_category_entertainment = {
  name: "Entertainment",
}

goods_category_household = {
  name: "Household",
}

goods_category_sports = {
  name: "Sports",
}

goods_category_clothing = {
  name: "Clothing",
}

goods_category_tecnology = {
  name: "Tecnology",
}

goods_category_babieskids = {
  name: "Babies & Kids",
}

[goods_category_food, goods_category_entertainment, goods_category_household, goods_category_sports, goods_category_clothing, goods_category_tecnology, goods_category_babieskids].each do |attributes|
  goods_category = GoodsCategory.create(attributes)
  puts "Created #{goods_category.name}"
end



puts "Creating time categories..."
time_category_chidren = {
  name: "Children & Youth",
}

time_category_elderly = {
  name: "Elderly",
}

time_category_animals = {
  name: "Animals",
}

time_category_disability = {
  name: "People with disability",
}

time_category_unsheltered = {
  name: "Unsheltered",
}

time_category_environment = {
  name: "Environment",
}

[time_category_chidren, time_category_elderly, time_category_animals, time_category_disability, time_category_unsheltered, time_category_environment].each do |attributes|
  time_category = TimeCategory.create(attributes)
  puts "Created #{time_category.name}"
end


puts "Creating goods categorizations..."

GoodsCategorization.create(nonprofit_id: ventos_ativos.id, goods_category_id: goods_category_entertainment)
GoodsCategorization.create(nonprofit_id: pro_juventude.id, goods_category_id: goods_category_sports)


puts "Creating time categorizations..."

TimeCategorization.create(nonprofit_id: longevidade.id, time_category_id: time_category_elderly)
TimeCategorization.create(nonprofit_id: barriga_cheia.id, time_category_id: time_category_unsheltered)


puts "Finished!"
