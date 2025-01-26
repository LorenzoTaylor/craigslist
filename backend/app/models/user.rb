class User
    attr_accessor :username
    @@users = []
  
    def initialize(username)
      @username = username
      @@users << self
    end
  
    def self.all
      @@users
    end
  
    def self.find(username)
      @@users.find { |user| user.username == username }
    end
  
    def self.delete(username)
      user = find(username)
      @@users.delete(user) if user
    end
  end
  