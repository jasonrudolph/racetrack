            
class RaceController {
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only
    // accept POST requests
    def allowedMethods = [delete:'POST',
                          save:'POST',
                          update:'POST']

    def list = {
        if(!params.max)params.max = 10
        [ raceList: Race.list( params ) ]
    }

    def show = {
        [ race : Race.get( params.id ) ]
    }

    def delete = {
        def race = Race.get( params.id )
        if(race) {
            race.delete()
            flash.message = "Race ${params.id} deleted."
            redirect(action:list)
        }
        else {
            flash.message = "Race not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def race = Race.get( params.id )

        if(!race) {
                flash.message = "Race not found with id ${params.id}"
                redirect(action:list)
        }
        else {
            return [ race : race ]
        }
    }

    def update = {
        def race = Race.get( params.id )
        if(race) {
             race.properties = params
            if(race.save()) {
                flash.message = "${params.name} updated."
                redirect(action:show,id:race.id)
            }
            else {
                render(view:'edit',model:[race:race])
            }
        }
        else {
            flash.message = "Race not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def race = new Race()
        race.properties = params
        return ['race':race]
    }

    def save = {
        def race = new Race()
        race.properties = params
        if(race.save()) {
            flash.message = "${params.name} saved."
            redirect(action:show,id:race.id)
        }
        else {
            render(view:'create',model:[race:race])
        }
    }

}