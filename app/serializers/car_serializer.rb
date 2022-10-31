class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :owner
end
