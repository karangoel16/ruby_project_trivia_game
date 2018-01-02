class QuizController < ApplicationController
  def index
  end

  def quest
    #we will get random questions here so that we can give it to the users later to show them
    @questions = Question.all.shuffle[0..4]
    @questions.each_with_index{|question,index|
      question.total=question.total+1
      question.update 
      array= []
      array.push(question.correctAnswer)
      array.push(question.notCorrectAnswer)
      @questions[index][:answer]=array.shuffle
    }
  end

  def result
    correct=0
    params.keep_if {|k, v| k=~ /id/ }
    params.each{|id,val|
      id_temp=id.dup
      id_temp.slice! 'id'
      question=Question.find(id_temp)
      if (question and question.correctAnswer.eql? val)
        correct=correct+1
        question.correct=question.correct+1
        question.update
      end
    }
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'You got '+correct.to_s+" out of 4 questions" }
    end
  end

end
