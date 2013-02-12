class UsersController < ApplicationController
    
    def login()
        response=User.login(params[:user],params[:password])
        if response==-1
            render :json => {:errCode => response}
        else
            render :json => {:errCode => 1, :count => response}
        end
    end
    
    def add()
        response=User.add(params[:user],params[:password])
        if response < 0
            render :json => {:errCode => response}
        else
            render :json => {:errCode => 1, :count => response}
        end
    end
    
end
