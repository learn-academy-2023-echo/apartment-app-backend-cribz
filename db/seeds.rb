user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [ 
  {
    street: "Hibbard Lane",
    unit: "20",
    city: "Colorado Springs",
    state: "CO",
    square_footage: 1000,
    price: "2000",
    bedrooms: 5,
    bathrooms: 2.5,
    pets: "YES",
    image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
  }
]

user2_apartments = [ 
  {
    street: "Giant Lane",
    unit: "290",
    city: "Old Colorado City",
    state: "CO",
    square_footage: 1000,
    price: "6000",
    bedrooms: 2,
    bathrooms: 2.5,
    pets: "YES",
    image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
  }
]

user1_apartments.each do |apartment|
  user1.apartments.create(apartment)
  p "created: #{apartment}"
end

user2_apartments.each do |apartment|
  user2.apartments.create(apartment)
  p "created: #{apartment}"
end