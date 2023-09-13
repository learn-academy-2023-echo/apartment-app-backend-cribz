require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test1@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do
    apartment = user.apartments.create(
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate city' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it 'should validate state' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it 'should validate price' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bathrooms: 2.5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it 'should validate bathrooms' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      pets: "YES",
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it 'should validate pets' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it 'should validate image' do
    apartment = user.apartments.create(
      street: "Hibbard Lane",
      unit: "20",
      city: "Colorado Springs",
      state: "CO",
      square_footage: 1000,
      price: "2000",
      bedrooms: 5,
      bathrooms: 2.5,
      pets: "YES",
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end

end
