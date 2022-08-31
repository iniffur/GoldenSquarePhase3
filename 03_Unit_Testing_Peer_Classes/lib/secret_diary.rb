class SecretDiary
    def initialize(diary) # diary is an instance of Diary
      @diary = diary
      @is_locked = true
    end
  
    def read
      fail "Go away!" if @is_locked == true
      return @diary.read if @is_locked == false 
    end
  
    def lock
      @is_locked = true
    end
  
    def unlock
      @is_locked = false
    end
  end