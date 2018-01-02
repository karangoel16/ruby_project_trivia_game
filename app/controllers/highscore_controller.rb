class HighscoreController < ApplicationController
    def index
        @users=User.all.sort_by{|user| user.score}.reverse[0..10]
    end
end