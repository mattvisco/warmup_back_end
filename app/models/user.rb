class User < ActiveRecord::Base
  attr_accessible :count, :name, :password
    
    SUCCESS=1
    ERR_BAD_CREDENTIALS=-1
    ERR_USER_EXISTS=-2
    ERR_BAD_USERNAME=-3
    ERR_BAD_PASSWORD=-4
    
    def self.login(usrname, pass)
        usr=User.find_by_name(usrname)
        if usr
            if usr.password==pass
                usr.count+=1
                usr.save
                return usr.count
            else
                ERR_BAD_CREDENTIALS
            end
        else
            ERR_BAD_CREDENTIALS
        end
    end
    
    def self.add(usrname, pass)
        usr=User.find_by_name(usrname)
        if usr
            ERR_USER_EXISTS
        else
            if usrname.length <= 0 || usrname.length > 128
                ERR_BAD_USERNAME
            elsif pass.length > 128
                ERR_BAD_PASSWORD
            else
                new_use=User.create(name: usrname,password: pass)
                new_use.count
            end
        end
    end
    
    def self.TESTAPI_resetFixture()
        User.delete_all
        SUCCESS
    end

end