class UserGameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :points, :winner
  belongs_to :user, serializer: UserGameUserSerializer
end
