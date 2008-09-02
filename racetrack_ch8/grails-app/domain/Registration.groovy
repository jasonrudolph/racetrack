class Registration { 
    Race race 
    String name 
    Date dateOfBirth 
    String gender = 'F' 
    String postalAddress 
    String emailAddress 
    Date createdAt = new Date() 

    static belongsTo = Race 

    static constraints = { 
        name(maxSize:50,blank:false) 
        dateOfBirth(nullable:false) 
        gender(inList:["M", "F"]) 
        postalAddress(nullable:true,maxSize:255) 
        emailAddress(maxSize:50,email:true) 
        race(nullable:false) 
    } 
    
    String toString(){"${this.name}:${this.emailAddress}"}         
}	
