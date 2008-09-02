            
class RegistrationController extends BaseController { 
    def beforeInterceptor = [action:this.&auth, except:'register']
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only
    // accept POST requests
    def allowedMethods = [delete:'POST',
                          save:'POST',
                          update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ registrationList: Registration.list( params ) ]
    }

    def show = {
        [ registration : Registration.get( params.id ) ]
    }

    def delete = {
        def registration = Registration.get( params.id )
        if(registration) {
            registration.delete()
            flash.message = "Registration ${params.id} deleted."
            redirect(action:list)
        }
        else {
            flash.message = "Registration not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def registration = Registration.get( params.id )

        if(!registration) {
                flash.message = "Registration not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ registration : registration ]
        }
    }

    def update = {
        def registration = Registration.get( params.id )
        if(registration) {
             registration.properties = params
            if(registration.save()) {
                flash.message = "${params.name} updated."                 
                redirect(action:show,id:registration.id)
            }
            else {
                render(view:'edit',model:[registration:registration])
            }
        }
        else {
            flash.message = "Registration not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def registration = new Registration()
        registration.properties = params
        return ['registration':registration]
    }

    def save = {
        def registration = new Registration()
        registration.properties = params
        if(registration.save()) {
            flash.message = "${params.name} saved."                 
            redirect(action:show,id:registration.id)
        }
        else {
            render(view:'create',model:[registration:registration])
        }
    }


    def register = { 
        def registration = new Registration() 
        registration.properties = params 

        if (request.method == 'GET') { 
            def race = Race.get(params.id) 
            return ['registration':registration,'race':race] 
        } 
        else { 
            if(registration.save()) { 
                flash.message = "Successfully registered for ${registration.race.name}" 
                redirect(controller:'race',action:'search') 
            } 
            else { 
                def race = Race.get(params['race.id']) 
                return ['registration':registration,'race':race] 
            } 
        } 
    }  
}