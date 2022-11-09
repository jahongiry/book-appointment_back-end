require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do

  path '/api/v1/add_reservation' do

    post('add_reservation reservation') do
      tags 'Reservations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          location: {type: :string},
          reservation_date: {type: :datetime},
          user_id:{type: :integer},
          car_id: {type: :integer},
        }
      }
      response(200, 'successful') do
        let(:reservation) {{reservation_date: Date.new(2022, 11, 9),
          location: "tirana",
          car_id: 13,
          user_id: 10}}
        run_test!
      end
    end
  end


end
