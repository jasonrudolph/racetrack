class ApplicationBootStrap { 
    def init = { servletContext -> 
        final String BACKUP_ADMIN = 'adminjoe' 
        if (!User.findByUserId(BACKUP_ADMIN)) { 
            new User(userId:BACKUP_ADMIN,password:'password').save() 
        } 
    } 
 
    def destroy = { 
    } 
} 
