class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :owner, :image_url
end
