class User {  
    String userId 
    String password 
 
    static constraints = { 
        userId(size:6..8,unique:true) 
        password(size:6..8) 
    } 
}