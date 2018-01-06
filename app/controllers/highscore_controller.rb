class HighscoreController < ApplicationController
    def index
        temp_users=User.all
        @avg_score=0
        @total=0
        @games=0
        temp_users.each{|u|
            @games=@games+u.total_games
            @total=@total+u.total_score
        }
        @users=temp_users.sort_by{|user| user.score}.reverse[0..10]
        @max_users = temp_users.sort_by{|user| user.score}[0..10]
    end
end