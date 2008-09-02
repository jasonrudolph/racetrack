class User {  
    String userId 
    String password 
 
    static constraints = { 
        userId(length:6..8,unique:true) 
        password(length:6..8) 
    } 
}