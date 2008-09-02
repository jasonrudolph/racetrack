
            
class UserController extends BaseController { 
    def beforeInterceptor = [action:this.&auth, except:['login', 'logout']] 
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only
    // accept POST requests
    def allowedMethods = [delete:'POST',
                          save:'POST',
                          update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ userList: User.list( params ) ]
    }

    def show = {
        [ user : User.get( params.id ) ]
    }

    def delete = {
        def user = User.get( params.id )
        if(user) {
            user.delete()
            flash.message = "User ${params.id} deleted."
            redirect(action:list)
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def user = User.get( params.id )

        if(!user) {
                flash.message = "User not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ user : user ]
        }
    }

    def update = {
        def user = User.get( params.id )
        if(user) {
             user.properties = params
            if(user.save()) {
                redirect(action:show,id:user.id)
            }
            else {
                render(view:'edit',model:[user:user])
            }
        }
        else {
            flash.message = "User not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def user = new User()
        user.properties = params
        return ['user':user]
    }

    def save = {
        def user = new User()
        user.properties = params
        if(user.save()) {
            redirect(action:show,id:user.id)
        }
        else {
            render(view:'create',model:[user:user])
        }
    }

    def login = { 
        if (request.method == "GET") { 
            session.userId = null 
            def user = new User() 
        } 
        else { 
            def user = User.findByUserIdAndPassword(params.userId, params.password) 
            if (user) { 
                session.userId = user.userId 

                def redirectParams = 
                    session.originalRequestParams ? session.originalRequestParams : 
                        [controller:'race'] 
                redirect(redirectParams) 
            } 
            else { 
                log.warn "Shields up!  Somebody's trying to hack through our " + 
                    "rock-solid DEFCON 1 security -- " + 
                    "User ID - $params.userId, Password - $params.password" 
                flash['message'] = 'Please enter a valid user ID and password' 
            } 
        } 
    } 

    def logout = { 
        session.userId = null 
        flash['message'] = 'Successfully logged out' 
        redirect(controller:'race', action:'search') 
    } 
}