class Types::MutationType < Types::BaseObject
  field :signUpUser, mutation: Mutations::Users::SignUp
end
