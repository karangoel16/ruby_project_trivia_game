class Question #< ApplicationRecord
    include Mongoid::Document
    field :name, type: String
end
