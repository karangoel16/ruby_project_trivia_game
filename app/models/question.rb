class Question #< ApplicationRecord
    include Mongoid::Document
    field :name, type: String
    field :correct, type: String
    field :notCorrect, type: String
    field :user, type: String
end
