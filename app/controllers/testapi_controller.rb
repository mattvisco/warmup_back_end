class TestapiController < ApplicationController
    
    def resetFixture()
        response=User.TESTAPI_resetFixture()
        render :json => {:errCode => response}
    end
    
    def unitTests()
        output=`ruby -I test test/unit/user_test.rb`
        words=output.split(" ")
        index=words.index("tests,")-1
        test=Integer(words[index])
        index=words.index("failures,")-1
        fail=Integer(words[index])
        render :json => {:totalTests => test, :nrFailed => fail, :output => output}
    end
end
