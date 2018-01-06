require 'pp'

class QuizController < ApplicationController
  def index
  end

  def quest
    #we will get random questions here so that we can give it to the users later to show them
    val=params["tags"]
    num = params["questions"]
    @questions=nil
    @questions = Question.tagged_with_any(val)
    if !@questions.exists?
      redirect_to root_url, notice: "No question exist with this tag" 
    else
      current_user.total_games+=1
      current_user.update
      @questions = @questions[0..num.to_i]
      @questions.each_with_index{|question,index|
      question.total=question.total+1
      question.update 
      array= []
      array.push(question.correctAnswer)
      array.push(question.notCorrectAnswer)
      @questions[index][:answer]=array.shuffle
    }
    end
  end

  def result
    correct=0
    score=0
    streak_max=0
    streak_min=0
    params.keep_if {|k, v| k=~ /id/ }
    params.each{|id,val|
      id_temp=id.dup
      id_temp.slice! 'id'
      question=Question.find(id_temp)
      if (question and question.correctAnswer.eql? val)
        correct=correct+1
        score=score+4
        question.correct=question.correct+1
        question.update
        streak_min=0
        streak_max=streak_max +1
        current_user.streak_correct = streak_max > current_user.streak_correct ?  streak_max :  current_user.streak_correct 
      else
        score=score-1
        streak_max=0
        streak_min=streak_min +1
        current_user.streak_incorrect = streak_min > current_user.streak_incorrect ?  streak_min :  current_user.streak_incorrect 
      end
      current_user.score = current_user.score> score ? current_user.score : score
    }
    current_user.total_score=current_user.total_score+current_user.score
    current_user.update
    respond_to do |format|
        format.html { redirect_to root_url, notice: "Your score is "+score.to_s}
    end
  end

end
