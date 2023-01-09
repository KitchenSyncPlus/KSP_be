class RecipeSerializer
  include JSONAPI::Serializer
  attributes :ext_id, :label
end
