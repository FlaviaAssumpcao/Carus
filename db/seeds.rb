# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
GoodsCategorization.destroy_all
TimeCategorization.destroy_all
TimeCategory.destroy_all
GoodsCategory.destroy_all
Nonprofit.destroy_all
User.destroy_all



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
ventos_ativos = Nonprofit.new(
  name: "Associação Ventos Ativos",
  brief_description: "A nonprofit organization aiming the protection of the youth through sports, dance and art",
  address: "Alto do Varejao, Lisboa",
  phone: "212 324 543",
  email: "info@ventosativos.pt",
  city: "Lisboa",
  full_description: "Through sports, dance and art the Associação Ventos Ativos provides activities, workshop and regular training through the selection of commited young kids",
  min_time: 10,
  max_time: 12
)
ventos_ativos.save!
puts "Created #{ventos_ativos.name}"

barriga_cheia = Nonprofit.new(
  name: "Associação Barriga Cheia",
  brief_description: "A nonprofit organization collecting and distributing food for the people in need",
  address: "Rua do Conde de Redondo 91B, Lisboa",
  phone: "212 100 200",
  email: "info@barrigacheia.pt",
  city: "Lisboa",
  full_description: "The Associação Barriga Cheia collects, organizes and distributes food on different locations on a weekly basis for the people in need. ",
  min_time: 14,
  max_time: 17
)
barriga_cheia.save!
puts "Created #{barriga_cheia.name}"

pro_juventude  = Nonprofit.new(
  name: "Grupo Pro-juventude",
  brief_description: "A nonprofit organization - entertainment",
  address: "Alto do Varejao, Lisboa",
  phone: "212 324 000",
  email: "info@projuventude.pt",
  city: "Lisboa",
  full_description: "Grupo Pro-Juventude provides activities, workshop and regular training for teenagers from disadvantaged backgrounds"
)
pro_juventude.save!
puts "Created #{pro_juventude.name}"

longevidade = Nonprofit.new(
  name: "Associação de Apoio à Longevidade",
  brief_description: "A nonprofit organization looking after the older adults",
  address: "Avenida Madame Curie, 18, Lisboa",
  phone: "216 000 222",
  email: "info@longevidade.pt",
  city: "Lisboa",
  full_description: "Associação de Apoio à Longevidade invests all its effort on the wellbeing of its guests. It provides basic care and entertainment to the older adults",
  min_time: 10,
  max_time: 14
)
longevidade.save!
puts "Created #{longevidade.name}"

  # file = URI.open(attributes[:url])
  # experience.photo.attach(io: file, filename: "experience.jpg", content_type: "image/jpg")
  # experience.save


puts "Creating goods categories..."
goods_category_food = GoodsCategory.create!(
  name: "Food"
)

goods_category_entertainment = GoodsCategory.create!(
  name: "Entertainment"
)

goods_category_household = GoodsCategory.create!(
  name: "Household"
)

goods_category_sports = GoodsCategory.create!(
  name: "Sports"
)

goods_category_clothing = GoodsCategory.create!(
  name: "Clothing"
)

goods_category_tecnology = GoodsCategory.create!(
  name: "Tecnology"
)

goods_category_babieskids = GoodsCategory.create!(
  name: "Babies & Kids"
)


puts "Creating time categories..."
time_category_chidren = TimeCategory.create!(
  name: "Children & Youth"
)

time_category_elderly = TimeCategory.create!(
  name: "Elderly"
)

time_category_animals = TimeCategory.create!(
  name: "Animals"
)

time_category_disability = TimeCategory.create!(
  name: "People with disability"
)

time_category_unsheltered = TimeCategory.create!(
  name: "Unsheltered"
)

time_category_environment = TimeCategory.create!(
  name: "Environment"
)


puts "Creating goods categorizations..."
GoodsCategorization.create!(nonprofit: ventos_ativos, goods_category: goods_category_entertainment)
GoodsCategorization.create!(nonprofit: pro_juventude, goods_category: goods_category_sports)


puts "Creating time categorizations..."

TimeCategorization.create!(nonprofit: longevidade, time_category: time_category_elderly)
TimeCategorization.create!(nonprofit: barriga_cheia, time_category: time_category_unsheltered)


puts "Finished!"
