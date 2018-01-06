class HighscoreController < ApplicationController
    def index
        temp_users=User.all
        @avg_score=0
        @total=0
        @games=0
        @long_streak=0
        @min_streak = 0
        temp_users.each{|u|
            @games=@games+u.total_games
            @total=@total+u.total_score
            @long_streak = (@long_streak < u.streak_correct) ? u.streak_correct : @long_streak 
            @min_streak = (@min_streak < u.streak_incorrect) ? u.streak_incorrect : @min_streak
        }
        @users=temp_users.sort_by{|user| user.score}.reverse[0..10]
        @max_users = temp_users.sort_by{|user| user.score}[0..10]
    end
end