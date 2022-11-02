class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :owner, :model
end
