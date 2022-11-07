require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/signup' do

    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          first_name:{type: :string},
          last_name: {type: :string},
          username: {type: :string}
        },
        required: ['first_name', 'last_name', 'username']
      }

      response('200', 'successful') do
         let (:user) do
          {
            first_name: 'Amy',
            last_name: 'Veis',
            username: 'Amy_Albania'
          }
        end
        # after do |example|
        #   example.metadata[:response][:content] = {
        #     'application/json' => {
        #       example: JSON.parse(response.body, symbolize_names: true)
        #     }
        #   }
        run_test!
      end
    end
  end
end
