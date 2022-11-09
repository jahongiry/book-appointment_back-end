# require 'swagger_helper'

# RSpec.describe 'api/v1/reservations', type: :request do

#   path '/api/v1/add_reservation' do

#     post('add_reservation reservation') do
#       tags 'Reservations'
#       consumes 'application/json'
#       produces 'application/json'
#       security [bearerAuth: []]
#       parameter name: :reservation, in: :body, schema: {
#         type: :object,
#         properties: {
#           date: {type: :string},
#           reservation_id: {ty}
#         }
#       response(200, 'successful') do

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end

#   path '/api/v1/{user_id}/my_reservations' do
#     # You'll want to customize the parameter types...
#     parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

#     get('my_reservations reservation') do
#       response(200, 'successful') do
#         let(:user_id) { '123' }

#         after do |example|
#           example.metadata[:response][:content] = {
#             'application/json' => {
#               example: JSON.parse(response.body, symbolize_names: true)
#             }
#           }
#         end
#         run_test!
#       end
#     end
#   end
# end
