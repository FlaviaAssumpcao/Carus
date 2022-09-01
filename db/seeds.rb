require "open-uri"

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
  brief_description: "Protection of the youth through sports, dance and art.",
  address: "Rua Camilo Castelo Branco, 12, Évora",
  phone: "212 324 543",
  email: "info@ventosativos.pt",
  city: "Évora",
  full_description: "Through sports, dance and art the Associação Ventos Ativos is a non-profit that provides activities, workshop and regular training through the selection of commited young kids.",
  min_time: 10,
  max_time: 12
)
file_1 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662032791/Carus/ventos_ativos_engf4l.png")
ventos_ativos.logo.attach(io: file_1, filename: "ventos_ativos.png", content_type: "image/png")

file_2 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045072/Carus/Ventos%20Ativos/np_15_bkfhne.jpg")
ventos_ativos.photos.attach(io: file_2, filename: "ventos_ativos_2.png", content_type: "image/png")

file_3 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045072/Carus/Ventos%20Ativos/np_12_tjrb48.jpg")
ventos_ativos.photos.attach(io: file_3, filename: "ventos_ativos_3.png", content_type: "image/png")

ventos_ativos.save!
puts "Created #{ventos_ativos.name}"



empowered_people = Nonprofit.new(
  name: "Fundacao Empowered People",
  brief_description: "A nonprofit organization improving work opportunities for people with disability.",
  address: " Estrada da Chainha, 36, Évora",
  phone: "212 300 577",
  email: "info@empoweredpeople.pt",
  city: "Évora",
  full_description: "The Fundacao Empowered People is a nonprofit that provides workshops and professional trainings to people with disability to improve their work opportunities and self-esteem. Online options available.",
  min_time: 10,
  max_time: 14
)
file_4 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041270/Carus/empowered_people_p0pwdv.png")
empowered_people.logo.attach(io: file_4, filename: "empowered_people.png", content_type: "image/png")

file_5 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044892/Carus/Empowered%20People/np_3_jfzxv7.jpg")
empowered_people.photos.attach(io: file_5, filename: "empowered_people_2.png", content_type: "image/png")

file_6 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044892/Carus/Empowered%20People/np_24_jm3nqg.jpg")
empowered_people.photos.attach(io: file_6, filename: "empowered_people_3.png", content_type: "image/png")

empowered_people.save!
puts "Created #{empowered_people.name}"


longevidade = Nonprofit.new(
  name: "Associação de Apoio à Longevidade",
  brief_description: "An association focused on older adults.",
  address: "Avenida dos Aliados, 18, Porto",
  phone: "226 000 222",
  email: "info@longevidade.pt",
  city: "Porto",
  full_description: "The Associação de Apoio à Longevidade is a non-profit that invests all its effort on the wellbeing of its guests. We provide basic care and entertainment to older adults in need.",
  min_time: 10,
  max_time: 14
)
file_7 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041269/Carus/longevidade.png_ztpggx.png")
longevidade.logo.attach(io: file_7, filename: "longevidade.png", content_type: "image/png")

file_8 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044916/Carus/Longevidade/np_25_yxwwaj.jpg")
longevidade.photos.attach(io: file_8, filename: "longevidade_2.png", content_type: "image/png")

file_9 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044916/Carus/Longevidade/np_18_kyi3pu.jpg")
longevidade.photos.attach(io: file_9, filename: "longevidade_3.png", content_type: "image/png")

longevidade.save!
puts "Created #{longevidade.name}"

pet_protection = Nonprofit.new(
  name: "Pet Protection Association",
  brief_description: "Protect and rescue domestic animals.",
  address: "Av. de Fernão de Magalhães, 971, Porto",
  phone: "226 121 222",
  email: "info@petprotection.pt",
  city: "Porto",
  full_description: "Pet Protection Association is a nonprofit organization for the protection and rescue of domestic animals. We campaign for better treatment of all domestic animals in Portugal.",
  min_time: 10,
  max_time: 17
)
file_10 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041269/Carus/pet_protection.png_hcnca2.png")
pet_protection.logo.attach(io: file_10, filename: "pet_protection.png", content_type: "image/png")

file_11 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044974/Carus/Pet%20Protection/np_26_ranqon.jpg")
pet_protection.photos.attach(io: file_11, filename: "pet_protection_2.png", content_type: "image/png")

file_12 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044974/Carus/Pet%20Protection/np_4_ivyeqn.jpg")
pet_protection.photos.attach(io: file_12, filename: "pet_protection_3.png", content_type: "image/png")

pet_protection.save!
puts "Created #{pet_protection.name}"


reuse_recicle = Nonprofit.new(
  name: "Reuse & Recicle Awareness Group",
  brief_description: "We provide waste reduction awareness programs to the community.",
  address: "Bairro Almeida Araújo, 10, Queluz",
  phone: "226 121 233",
  email: "info@reuserecicle.pt",
  city: "Lisboa",
  full_description: "The Reuse & Recicle Group is a non-profit focused on bringing waste reduction awareness to the community through free workshop for adults and kids. We have a special program for primary and secondary school.",
  min_time: 9,
  max_time: 16
)
file_13 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041269/Carus/reuse_recicle_tpw0si.png")
reuse_recicle.logo.attach(io: file_13, filename: "reuse_recicle.png", content_type: "image/png")

file_14 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045030/Carus/Reuse%20Recicle/np_27_gila5j.jpg")
reuse_recicle.photos.attach(io: file_14, filename: "reuse_recicle_2.png", content_type: "image/png")

file_15 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045030/Carus/Reuse%20Recicle/np_6_cnz8cv.jpg")
reuse_recicle.photos.attach(io: file_15, filename: "reuse_recicle_3.png", content_type: "image/png")

reuse_recicle.save!
puts "Created #{reuse_recicle.name}"


unsheltered = Nonprofit.new(
  name: "Unsheltered Association",
  brief_description: "A nonprofit association looking after people without shelter.",
  address: "Alto do Varejao, Lisboa",
  phone: "232 122 233",
  email: "info@reuserecicle.pt",
  city: "Lisboa",
  full_description: "The Unsheltered Association is a non-profit that collects and distributes food, personal hygiene products and clothing for people permanently or temporarily unsheltered. ",
  min_time: 9,
  max_time: 16
)
file_16 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041865/Carus/unsheltered_fbnlu8.png")
unsheltered.logo.attach(io: file_16, filename: "unsheltered.png", content_type: "image/png")

file_17 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045051/Carus/Unsheltered/np_20_vnbjm2.jpg")
unsheltered.photos.attach(io: file_17, filename: "unsheltered_2.png", content_type: "image/png")

file_18 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045051/Carus/Unsheltered/np_9_j2ur2r.jpg")
unsheltered.photos.attach(io: file_18, filename: "unsheltered_3.png", content_type: "image/png")

unsheltered.save!
puts "Created #{unsheltered.name}"


pro_juventude  = Nonprofit.new(
  name: "Grupo Pro-juventude",
  brief_description: "Activities, workshop and regular training for young kids.",
  address: "Alto do Varejao, Lisboa",
  phone: "212 324 000",
  email: "info@projuventude.pt",
  city: "Lisboa",
  full_description: "Grupo Pro-Juventude is a non-profit that provides activities, workshop and regular training for young kids from disadvantaged backgrounds."
)
file_19 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041270/Carus/pro_juventude.png_jg35eg.png")
pro_juventude.logo.attach(io: file_19, filename: " pro_juventude.png", content_type: "image/png")

file_20 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045007/Carus/Pro%20Juventude/np_22_sztue4.jpg")
pro_juventude.photos.attach(io: file_20, filename: "pro_juventude_2.png", content_type: "image/png")

file_21 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662045007/Carus/Pro%20Juventude/np_19_vpocjo.jpg")
pro_juventude.photos.attach(io: file_21, filename: "pro_juventude_3.png", content_type: "image/png")

pro_juventude.save!
puts "Created #{pro_juventude.name}"


barriga_cheia = Nonprofit.new(
  name: "Associação Barriga Cheia",
  brief_description: "Collecting and distributing food for families in need.",
  address: "Rua do Conde de Redondo 91B, Lisboa",
  phone: "212 100 200",
  email: "info@barrigacheia.pt",
  city: "Lisboa",
  full_description: "The Associação Barriga Cheia is a non-profit that collects, organizes and distributes food on different locations on a weekly basis for the people in need.",
  min_time: 14,
  max_time: 17
)
file_22 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041269/Carus/barriga_cheia.png_ogmsmf.png")
barriga_cheia.logo.attach(io: file_22, filename: "barriga_cheia.png", content_type: "image/png")

file_23 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044836/Carus/Barriga%20Cheia/np_2_icxt5i.jpg")
barriga_cheia.photos.attach(io: file_23, filename: "barriga_cheia_2.png", content_type: "image/png")

file_24 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044836/Carus/Barriga%20Cheia/np_13_qlxawk.jpg")
barriga_cheia.photos.attach(io: file_24, filename: "barriga_cheia_3.png", content_type: "image/png")

barriga_cheia.save!
puts "Created #{barriga_cheia.name}"


abrigo_santa = Nonprofit.new(
  name: "Abrigo Santa Sofia",
  brief_description: "We collect food and goods for families in need.",
  address: "Rua dos Tordos, 102, Albufeira",
  phone: "213 105 300",
  email: "info@abrigosantasofia.pt",
  city: "Lisboa",
  full_description: "The Abrigo Santa Sofia is a nonprofit that collects, organizes and distributes food and goods in different locations around the Algarve area for people in need. Join our Program and become a regular donator",
  min_time: 9,
  max_time: 12
)
file_25 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041269/Carus/abrigo_santa_qu1u98.png")
abrigo_santa.logo.attach(io: file_25, filename: "abrigo_santa.png", content_type: "image/png")

file_26 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044799/Carus/Abrigo%20Santa/np_10_knmjrn.jpg")
abrigo_santa.photos.attach(io: file_26, filename: "abrigo_santa_2.png", content_type: "image/png")

file_27 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044799/Carus/Abrigo%20Santa/np_23_zqmmso.jpg")
abrigo_santa.photos.attach(io: file_27, filename: "abrigo_santa_3.png", content_type: "image/png")

abrigo_santa.save!
puts "Created #{abrigo_santa.name}"


better_days = Nonprofit.new(
  name: "Better Days Shelters",
  brief_description: "Public shelter for those in need.",
  address: "Rua Professor Doutor Montalvão Marques, 7, Portimão",
  phone: "212 205 210",
  email: "info@betterdays.pt",
  city: "Portimão",
  full_description: "The Better Days Shelter is a nonprofit that provides temporary shelter and programs for re-socialization for those in need.",
  min_time: 16,
  max_time: 18
)
file_28 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662041270/Carus/better_days_zqe5p2.png")
better_days.logo.attach(io: file_28, filename: "better_days.png", content_type: "image/png")

file_29 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044855/Carus/Better%20Days/np_21_rgpmis.jpg")
better_days.photos.attach(io: file_29, filename: "better_days_2.png", content_type: "image/png")

file_30 = URI.open("https://res.cloudinary.com/dqhpwjdfd/image/upload/v1662044855/Carus/Better%20Days/np_28_mj19gw.jpg")
better_days.photos.attach(io: file_30, filename: "better_days_3.png", content_type: "image/png")

better_days.save!
puts "Created #{better_days.name}"



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

goods_category_multiple = GoodsCategory.create!(
  name: "Multiple categories"
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

time_category_multiple = TimeCategory.create!(
  name: "Multiple categories"
)


puts "Creating goods categorizations..."
GoodsCategorization.create!(nonprofit: ventos_ativos, goods_category: goods_category_entertainment)
GoodsCategorization.create!(nonprofit: pro_juventude, goods_category: goods_category_sports)


puts "Creating time categorizations..."

TimeCategorization.create!(nonprofit: longevidade, time_category: time_category_elderly)
TimeCategorization.create!(nonprofit: barriga_cheia, time_category: time_category_unsheltered)


puts "Finished!"
