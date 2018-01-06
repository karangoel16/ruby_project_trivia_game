class Question #< ApplicationRecord
    include Mongoid::Document
    include Mongoid::Taggable
    include Mongo::Voteable

     # set points for each vote
    voteable self, :up => +1, :down => -1
    field :name, type: String
    field :correctAnswer, type: String, default: "Correct"
    field :notCorrectAnswer, type: String, default: "Not Correct"
    field :user, type: String
    field :correct, type: Integer, default: 0
    field :total, type: Integer, default: 0
end
