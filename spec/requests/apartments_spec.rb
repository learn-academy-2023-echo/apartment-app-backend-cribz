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


  describe "POST /create" do
    it "creates an apartment" do
      apartment_params = {
        apartment: {
          street: "Hibbard Lane",
          unit: "20",
          city: "Colorado Springs",
          state: "CO",
          square_footage: 1000,
          price: "2000",
          bedrooms: 5,
          bathrooms: 2.5,
          pets: "YES",
          image:"https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU",
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(200)
    
      apartment = Apartment.first
      
      expect(apartment.street).to eq "Hibbard Lane"
      expect(apartment.unit).to eq "20"
      expect(apartment.city).to eq "Colorado Springs"
      expect(apartment.state).to eq "CO"
      expect(apartment.square_footage).to eq 1000
      expect(apartment.price).to eq "2000"
      expect(apartment.bedrooms).to eq 5
      expect(apartment.bathrooms).to eq 2.5
      expect(apartment.pets).to eq "YES"
      expect(apartment.image).to eq "https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU"
      expect(apartment.user_id).to eq user.id
    end

  end
end
