class Question #< ApplicationRecord
    include Mongoid::Document
    field :name, type: String
    field :correctAnswer, type: String, default: "Correct"
    field :notCorrectAnswer, type: String, default: "Not Correct"
    field :user, type: String
    field :correct, type: Integer, default: 0
    field :total, type: Integer, default: 0
end
