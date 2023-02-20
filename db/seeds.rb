# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

bob = User.create! :email => "bob@example.com", :password => "foobar!", :password_confirmation => "foobar!"
restaurant = Restaurant.create!(
  name: "Bob's Pub",
  address: "111 Main Street",
  address2: "Suite 100",
  city: "Chicago",
  state: "IL",
  zipcode: "6007",
  phone: "555-867-5309",
  web: "http://google.com",
  facebook: "BobsBar",
  twitter: "@bobsbar",
  instagram: "bobsbar",
  email: "bob@example.com",
  user: bob
)

Date::DAYS_INTO_WEEK.each_value do |i|
  hour = BusinessHour.create!(
    day: i,
    open_at: "10:00:00",
    close_at: "19:00:00",
    restaurant: restaurant,
    closed: i == 0 ? true : false
  )
end

menu = Menu.create!(
  title: "Spring Menu",
  restaurant: restaurant,
  user: bob,
  published: true,
  description: "Welcome to our Pub.  Please enjoy one of our signature dishes."
)

soup_section = Section.create!(
  menu: menu,
  position: 0,
  title: "Soups",
  description: "Our soups are hand made in our kitchen."
)

pizza_section = Section.create!(
  menu: menu,
  position: 1,
  title: "Pizzas",
  description: "Wood fired and delicous"
)

soup_image = URI.open("https://www.budgetbytes.com/wp-content/uploads/2020/11/French-Onion-Soup-bowl.jpg")
soup = Item.create!(
  title: "French Onion",
  description: "Homemade French Onion Soup requires time and patience",
  price: 7.50,
  section: soup_section
)
soup.image.attach(io: soup_image, filename: 'French-Onion-Soup-bowl.jpg', content_type: 'image/jpg')

pizza_image = URI.open("https://sipbitego.com/wp-content/uploads/2021/08/Pepperoni-Pizza-Recipe-Sip-Bite-Go.jpg")
pizza = Item.create!(
  title: "Pepperoni Pizza",
  description: "Homemade pizza with our signature blendof spices",
  price: 14.50,
  section: pizza_section
)
pizza.image.attach(io: pizza_image, filename: 'pepperoni_pizza.jpg', content_type: 'image/jpg')


