class RecipeSerializer
  include JSONAPI::Serializer
  attributes :ingredients, :source, :url
end
