require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user){User.create(
   email: 'test1@example.com',
   password: 'password',
   password_confirmation: 'password'
  )}

  describe "GET /index" do
    it 'gets a list of apartments' do
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
        image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
      )
      get '/apartments'
      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq("Hibbard Lane")
    end
  end
end
