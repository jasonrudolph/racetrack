class Race {  
    String name 
    Date startDateTime 
    String city 
    String state 
    Float distance 
    Float cost 
    Integer maxRunners = 100000 
     
    static hasMany = [registrations:Registration]  
    
    static constraints = { 
        name(maxLength:50,blank:false) 
        startDateTime(validator: {return (it > new Date())}) 
        city(maxLength:30,blank:false) 
        state(inList:['GA', 'NC', 'SC', 'VA'],blank:false) 
        distance(min:3.1f,max:100f) 
        cost(min:0f,max:999.99f) 
    } 
    
    String toString() { "${this.name} : ${this.city}, ${this.state}" }         
}