class RecipeSerializer
  include JSONAPI::Serializer
  attributes :ingredients, :label, :uri
end
