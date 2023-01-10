class GroupSerializer
  include JSONAPI::Serializer
  attributes :name, :about, :users
end
