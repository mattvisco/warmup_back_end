class TestapiController < ApplicationController
    
    def resetFixture()
        response=User.TESTAPI_resetFixture()
        render :json => {:errCode => response}
    end
    
    def unitTests()
        render :json => {:errCode => 1}
    end
end
