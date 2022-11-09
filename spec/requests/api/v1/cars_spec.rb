require 'swagger_helper'
require 'jwt'
RSpec.describe 'api/v1/cars', type: :request do

  path '/api/v1/all_cars' do

    get('all_cars car') do
      tags 'Cars'
      consumes 'application/json'
      produces 'application/json'
  

      response(200, 'successful') do
        schema type: :array,
        items: {
          type: :object,
          properties: {
            id: {type: :integer},
            name: {type: :string},
            cost: {type: :integer},
            description: {type: :text},
            image_url: {type: :string},
            owner: {type: :integer}
            },
            required: [id, name, description]
          }
        run_test!
      end
    end
  end

  path '/api/v1/add_car' do

    post('add_car car') do
      
      tags 'Cars'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cost: { type: :integer },
          description: {type: :string},
          owner:{type: :integer},
          image_url: {type: :string}
        },
        required: [ 'name', 'cost','description', 'image_url', 'owner']
      }
      response(200, 'successful') do
        # let(:Authorization){"#{token}"}
          let(:car){{name:'Honda',cost: 300, description:'Nice car', owner: 6, image:'https://www.istockphoto.com/photo/pink-retro-toy-car-isolated-on-white-gm1386831709-444935852?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fcars&utm_term=cars%3A%3A%3A'}}
        run_test!
      end
    end
  end

  path '/api/v1/show_car/{id}' do

    get('show_car car') do
      tags 'Cars'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response(200, 'successful') do
        schema type: :object,
        properties:{
          name: {type: :string},
          image_url: {type: :string},
          cost: {type: :integer},
          description: {type: :string}
        }
        let (:id) do
          Car.create(name:'Mustang', image_url:'',cost:3000,description:"Fast and endurable")
        end
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    delete('delete car') do
    tags 'Cars'
    produces 'application/json'
    parameter name: 'id', in: :path, type: :integer
      response(200, 'successful') do
        let(:id) do
          Car.create(name:'Audi', cost:5000, description:"the best car").id
        end
        run_test!
      end
    end
  end
end
