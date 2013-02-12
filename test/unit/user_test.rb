require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    SUCCESS=1
    ERR_BAD_CREDENTIALS=-1
    ERR_USER_EXISTS=-2
    ERR_BAD_USERNAME=-3
    ERR_BAD_PASSWORD=-4
    
    def testAdd1()
        #Tests that adding a user works
        assert_equal(SUCCESS,User.add("user1","pass"))
    end
        
    def testAddExists()
        #Tests that adding a duplicate user name fails
        assert_equal(SUCCESS,User.add("user1","pass"))
        assert_equal(ERR_USER_EXISTS,User.add("user1","pass"))
    end
    
    def testAdd2()
        #Tests that adding two users works
        assert_equal(SUCCESS,User.add("user1","pass"))
        assert_equal(SUCCESS,User.add("user2","pass"))
    end
                
    def testAddEmptyUsername()
        #Tests that adding an user with empty username fails
        assert_equal(ERR_BAD_USERNAME,User.add("","pass"))
    end
    
    def testAddLongUsername()
        #Tests that adding an user with username > 128 char fails
        user="u"*129
        assert_equal(ERR_BAD_USERNAME,User.add(user,"pass"))
    end
    
    def testAddLongPassword()
        #Tests that adding an user with password > 128 char fails
        pass="p"*129
        assert_equal(ERR_BAD_PASSWORD,User.add("user1",pass))
    end
    
    def testEmptyPassword()
        #Tests that adding an user with password > 128 char works
        assert_equal(SUCCESS,User.add("user1",""))
    end
    
    
    def testLogin()
        #Tests that login with returning user works
        user=User.add("user1","pass")
        assert_equal(2,User.login("user1","pass"))
    end
    
    def testLoginCount()
        #Tests that when login with returning user count updates properly
        user=User.add("user1","pass")
        assert_equal(2,User.login("user1","pass"))
        assert_equal(3,User.login("user1","pass"))
        assert_equal(4,User.login("user1","pass"))
    end
    
    def testBadLogin1()
        #Tests that login with non-existing user fails
        assert_equal(ERR_BAD_CREDENTIALS,User.login("user1","pass"))
    end
    
    def testBadLogin2()
        #Tests that login with wrong password fails
        User.add("user1","pass")
        assert_equal(ERR_BAD_CREDENTIALS,User.login("user1","p"))
    end
    
    
end
