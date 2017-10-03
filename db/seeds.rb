# First remove all existing entries from our database

Photo.delete_all

LineItem.delete_all       # this is important!
Purchase.delete_all          # this is important!

Category.delete_all
Product.delete_all

Profile.delete_all
User.delete_all

# Copied from bnb. Does this work properly?
ActiveRecord::Base.connection.execute("DELETE  from categories_products")


# Create some users
buyer1 = User.create( {name: "Giulio", email: "giulio@gmail.com", role: "buyer", password: "abcd1234"} )
buyer2 = User.create( {name: "Armando", email: "armando@gmail.com", role: "buyer", password: "abcd1234"} )
seller1 = User.create( {name: "Irene", email: "irene@gmail.com", role: "seller", password: "abcd1234"} )
seller2 = User.create( {name: "Marco", email: "marco@gmail.com", role: "seller", password: "abcd1234"} )
seller3 = User.create( {name: "Luca", email: "luca@gmail.com", role: "seller", password: "abcd1234"} )

photo_profile_1 = File.new(open("https://i2.cdn.turner.com/cnnnext/dam/assets/140926165711-john-sutter-profile-image-large-169.jpg"))
photo_profile_2 = File.new(open("https://www.newschool.edu/uploadedImages/Parsons/Profiles/jamer_hunt_profile.jpg?n=4468"))
photo_profile_3 = File.new(open("http://res.cloudinary.com/dgmqizxd0/image/upload/v1494101467/y7y6ikmo8r5co64ehicy.jpg"))
photo_profile_4 = File.new(open("http://i2.cdn.cnn.com/cnnnext/dam/assets/150108120351-john-branch-profile-large-tease.jpg"))
photo_profile_5 = File.new(open("http://res.cloudinary.com/dgmqizxd0/image/upload/v1506765956/cqjh4zafppzmakrdxbwx.jpg"))

#Create profiles

profile1 = Profile.create({first_name:"Giulio", last_name:"Gallerini", bio: Faker::Hipster.paragraph, user: buyer1, photo: photo_profile_1 })
profile1 = Profile.create({first_name:"Armando", last_name:"Tillo", bio: Faker::Hipster.paragraph, user: buyer2, photo: photo_profile_2 })
profile1 = Profile.create({first_name:"Irene", last_name:"Tocino", bio: Faker::Hipster.paragraph, user: seller1, photo: photo_profile_3 })
profile1 = Profile.create({first_name:"Marco", last_name:"Lavini", bio: Faker::Hipster.paragraph, user: seller2, photo: photo_profile_4 })
profile1 = Profile.create({first_name:"Luca", last_name:"Pirró", bio: Faker::Hipster.paragraph, user: seller3, photo: photo_profile_5 })
# Create some categories
category1 = Category.create ( {name: "Wood"} )
category2 = Category.create ( {name: "White"} )
category3 = Category.create ( {name: "Black"} )

# Create some photos
photo1 = Photo.create(remote_image_url: "http://ognature.com/wp-content/uploads/2017/05/sunset-birds-rays-sky-sundown-lovely-pier-clouds-nature-nice-pretty-beautiful-crystal-glow-sun-reflection-clear-dock-wallpaper-desert-1366x768.jpg")
photo2 = Photo.create(remote_image_url: "https://scontent-ams3-1.xx.fbcdn.net/v/t31.0-8/13710440_1051205764965910_3389874276783452082_o.jpg?oh=21f4f7df6a0dcef0b9b86bc12ae3cb78&oe=5A4B7685")
photo3 = Photo.create(remote_image_url: "https://scontent-ams3-1.xx.fbcdn.net/v/t31.0-8/12823398_962882980464856_1474956280106315231_o.jpg?oh=8611b107e939f779650d0735991ca912&oe=5A449617")
photo4 = Photo.create(remote_image_url: "https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i86150a51964976d0/version/1490283314/most-beautiful-landscapes-in-europe-copyright-vicky-sp-european-best-destinations.jpg")
photo5 = Photo.create(remote_image_url: "https://scontent-ams3-1.xx.fbcdn.net/v/t31.0-8/12307382_909851982434623_881646476965396735_o.jpg?oh=afd3749f3717cfc1ac4efde5db7c7d5c&oe=5A4A682E")
photo6 = Photo.create(remote_image_url: "https://cdn.pixabay.com/photo/2016/10/12/02/22/lake-mcdonald-1733307_1280.jpg")
photo7 = Photo.create(remote_image_url: "https://scontent-ams3-1.xx.fbcdn.net/v/t31.0-8/10960088_771742822912207_4737997431384790923_o.jpg?oh=8f3751bd242879908ac3978931bc722c&oe=5A3B9F1C")
photo8 = Photo.create(remote_image_url: "https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i9d6e7fb91ac77594/version/1490381820/best-landscapes-in-europe-godafoss-waterfall-at-sunset-iceland-europe-copyright-ronnybas.jpg")
photo9 = Photo.create(remote_image_url: "http://media1.santabanta.com/full1/Outdoors/Landscapes/landscapes-284a.jpg")
photo10 = Photo.create(remote_image_url: "https://i.pinimg.com/originals/a0/09/10/a00910cd84050de8a10f4043ab8ca630.jpg")
photo11 = Photo.create(remote_image_url: "https://www.outdoorphotographer.com/images/stories/2016/may/landscapes/lead.jpg")
photo12 = Photo.create(remote_image_url: "https://images.fineartamerica.com/images-medium-large-5/patagonia-mountain-road-jimmy-mcintyre.jpg")

# Create some products
product1 = Product.create ( {name: "Print 5x5 Framed Wood", price: 24.99, description: Faker::Hipster.paragraph, photos: [photo1], user: seller1, categories: [category1] } )
product2 = Product.create ( {name: "Print 13x18 Framed White", price: 34.95, description: Faker::Hipster.paragraph, photos: [photo2], user: seller2, categories: [category2] } )
product3 = Product.create ( {name: "Print 10x10 Framed Black", price: 15.00, description: Faker::Hipster.paragraph, photos: [photo3], user: seller3, categories: [category3] } )
product4 = Product.create ( {name: "Print 30x30 Framed Wood", price: 44.95, description: Faker::Hipster.paragraph, photos: [photo4], user: seller2, categories: [category1] } )
product5 = Product.create ( {name: "Print 5x5 Framed Black", price: 24.99, description: Faker::Hipster.paragraph, photos: [photo5], user: seller1, categories: [category3] } )
product6 = Product.create ( {name: "Print 13x18 Framed Wood", price: 34.95, description: Faker::Hipster.paragraph, photos: [photo6], user: seller2, categories: [category1] } )
product7 = Product.create ( {name: "Print 10x10 Framed Black", price: 15.00, description: Faker::Hipster.paragraph, photos: [photo7], user: seller3, categories: [category3] } )
product8 = Product.create ( {name: "Print 75x50 Framed White", price: 99.95, description: Faker::Hipster.paragraph, photos: [photo8], user: seller2, categories: [category2] } )
product9 = Product.create ( {name: "Print 30x30 Framed Black", price: 44.95, description: Faker::Hipster.paragraph, photos: [photo9], user: seller3, categories: [category3] } )
product10 = Product.create ( {name: "Print 150x50 Framed Wood", price: 125.00, description: Faker::Hipster.paragraph, photos: [photo10], user: seller2, categories: [category1] } )
product11 = Product.create ( {name: "Print 10x10 Framed White", price: 15.00, description: Faker::Hipster.paragraph, photos: [photo11], user: seller1, categories: [category2] } )
product12 = Product.create ( {name: "Print 5x5 Framed White", price: 14.99, description: Faker::Hipster.paragraph, photos: [photo12], user: seller2, categories: [category2] } )

# Create some fake line items
line_item1 = LineItem.create ( {amount: 1, product: product1} )
line_item2 = LineItem.create ( {amount: 2, product: product2} )

# Create a fake purchase
purchase1 = Purchase.create ( { purchase_number: 1, payment_method: Purchase::PAYMENT_METHODS[1], user: buyer1, line_items: [line_item1, line_item2] } )
