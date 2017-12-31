class QuizController < ApplicationController
  def index
  end
  def quest
    #we will get random questions here so that we can give it to the users later to show them
    @questions = Question.all.shuffle[0..4]
    @questions.each_with_index{|question,index| 
      array= []
      array.push(question.correctAnswer)
      array.push(question.notCorrectAnswer)
      #puts index
      @questions[index][:answer]=array.shuffle
    }
  end
end
