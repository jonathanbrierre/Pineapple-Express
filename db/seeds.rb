# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs




Item.destroy_all

#shirts
Item.create(name: 'Aloha Pine', description: "Experience Hawaii anywhere in the world just by wearing this shirt. ", price: '97.99', clothing_type: 'shirt', img_url:"items/shirts/aloha.jpeg")
Item.create(name: 'Aloha Beaches', description: "Nothing says 'Aloha Beaches' quite like this shirt.", price: '17.99', clothing_type: 'shirt', img_url:'items/shirts/aloha_beaches.jpeg')
Item.create(name: 'Ananas', description: "What's Addidas when you have Ananas?", price: '37.99', clothing_type: 'shirt', img_url:'items/shirts/ananas.jpeg')
Item.create(name: 'Be A Pineapple', description: "A cute gift to give to your girlfriend when you forgot her birthday and she hasnt spoken to you for the past week. She's probably not your girlfriend anymore, though it's the thought that counts, right?", price: '19.99', clothing_type: 'shirt', img_url:'items/shirts/be_a_pine.jpeg')
Item.create(name: 'Gradient Pineapple', description: "You're too cool for a regular pineapple - that's why you clicked this shirt instead of any other one.", price: '17.99', clothing_type: 'shirt', img_url:'items/shirts/gradient_pine.jpeg')
Item.create(name: 'Pina Colada', description: "Cause when does life ever gives us lemons?", price: '17.99', clothing_type: 'shirt', img_url:'items/shirts/pina_colada.jpeg')
Item.create(name: 'Pink Pineapple', description: "In case you've never seen a pink pineapple before, congratulations! Now you have 🥳  ", price: '19.99', clothing_type: 'shirt', img_url:'items/shirts/pink_pine.jpeg')
Item.create(name: 'Rainbow Pineapple', description: "The fibers of this shirt are made from the silk of the rare Cathulu Silk Worm. In other words, you can wear this shirt and say to your friends 'This shirt is made from the silk of the rare Cathulu Silk Worm,' and have them all think you're full of it.", price: '499.99', clothing_type: 'shirt', img_url:'items/shirts/rainbow_pine.jpeg')
Item.create(name: 'Trippy Hippie Pine', description: "So I heard you like music festivals 😏", price: '29.99', clothing_type: 'shirt', img_url:'items/shirts/trippy_pine.jpeg')

#pants
Item.create(name: 'You Go Glen Coco!', description: 'These are *THE* Pants', price: '74099.99', clothing_type: 'pants', img_url: 'items/pants/white_pine.jpeg')
Item.create(name: 'Pine Joggers', description: 'I dont know about you but I bought like 20 of these', price: '29.99', clothing_type: 'pants', img_url: 'items/pants/yellow_joggers.jpeg')
Item.create(name: 'Man Leggings', description: 'These leggings can get you all the ladies (or guys if you prefer guys)', price: '19.99', clothing_type: 'pants', img_url: 'items/pants/man_leggings.jpeg')
Item.create(name: 'Lady Leggings', description: 'Honey, you and I both know these leggings are cute af. Add 👏To 👏 Cart 👏', price: '19.99', clothing_type: 'pants', img_url: 'items/pants/lady_leggings.jpeg')
Item.create(name: 'Super Hippie', description: "Wear these to your favorite San Francisco disco 🕺 ", price: '39.99', clothing_type: 'pants', img_url: 'items/pants/hippie.jpeg')
Item.create(name: "Wit Yo Bomb A$$ Leggings", description: 'You already know these would look bomb af on you.', price: '34.99', clothing_type: 'pants', img_url: 'items/pants/bomb_leggings.jpeg')

#hats 

Item.create(name: 'Black Bucket', description: 'You dont have a cooler hat than this.', price: '20.00', clothing_type: 'hat', img_url: 'items/hats/black_hat.jpeg')
Item.create(name: 'White Bucket', description: 'Buy this hat and you will have another hat!', price: '20.00', clothing_type: 'hat', img_url: 'items/hats/white_hat.jpeg')
Item.create(name: 'Pink Bucket', description: 'Wear this hat and all the hippies will say hello to you.', price: '20.00', clothing_type: 'hat', img_url: 'items/hats/pink_hat.jpeg')