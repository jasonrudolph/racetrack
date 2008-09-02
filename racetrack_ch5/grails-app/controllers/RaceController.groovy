            
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

    def search = { 
        if (request.method == 'POST') { 
            RaceQuery query = new RaceQuery() 
            bindData(query, params) 

            def criteria = Race.createCriteria() 

            def results = criteria { 
                and { 
                    like('city', '%' + query.city + '%') 
                    like('state', '%' + query.state + '%') 
                    if (query.distance) { 
                        switch (query.distanceOperator) { 
                            case RaceQuery.DistanceOperator.AT_LEAST: 
                                ge('distance', query.distance) 
                                break 
                            case RaceQuery.DistanceOperator.EXACTLY: 
                                eq('distance', query.distance) 
                                break 
                            case RaceQuery.DistanceOperator.AT_MOST: 
                                le('distance', query.distance) 
                                break 
                            default: 
                                log.error "Found unexpected value for distance" 
                                   + " operator - ${query.distanceOperator}" 
                        } 
                    } 
                    // Add 1 day (24 hours) to the max date.  (If user selects a max 
                    // date of Jan 1st, the date object will hold Jan 1st 00:00, but 
                    // the user will want any events occurring thru Jan 1st 23:59.) 
                    between('startDateTime', query.minDate, query.maxDate + 1) 
                } 
            } 

            render(view:'list', model:[ raceList: results ]) 
        } 
    } 

}