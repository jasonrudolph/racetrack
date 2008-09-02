class RaceTests extends GroovyTestCase { 
     
    void testStartDateTimeCustomConstraintWithNullValue() { 
        def race = getValidRace() 
        race.startDateTime = null 
        assertValidationError(race, 'startDateTime',  
            'race.startDateTime.validator.invalid') 
    } 
 
    void testStartDateTimeCustomConstraintWithPastValue() { 
        def race = getValidRace() 
        race.startDateTime = new Date(0) 
        assertValidationError(race, 'startDateTime',  
            'race.startDateTime.validator.invalid') 
    } 
 
    void testNameMaxConstraint() { 
        def race = getValidRace() 
        race.name = 'It may very well take longer to type out the name of ' + 
            'this race than to just go run it.' 
        assertValidationError(race, 'name', 'race.name.maxSize.exceeded') 
    } 
     
    void testNameNullConstraint() {
        def race = getValidRace()
        race.name = null
        assertFalse(race.validate())
    }

    void testNameBlankConstraint() {
        def race = getValidRace()
        race.name = ''
        assertValidationError(race, 'name', 'race.name.blank')
    }

    void testCityNullConstraint() {
        def race = getValidRace()
        race.city = null
        assertFalse(race.validate())
    }

    void testCityBlankConstraint() {
        def race = getValidRace()
        race.city = ''
        assertValidationError(race, 'city', 'race.city.blank')
    }

    void testCityMaxConstraint() {
        def race = getValidRace()
        race.city = 'I pity the fool that lives in a city with a name this long.'
        assertValidationError(race, 'city', 'race.city.maxSize.exceeded')
    }

    void testStateNullConstraint() {
        def race = getValidRace()
        race.state = null
        assertFalse(race.validate())
    }

    void testStateBlankConstraint() {
        def race = getValidRace()
        race.state = ''
        assertValidationError(race, 'state', 'race.state.blank')
    }

    void testStateInListConstraint() {
        def race = getValidRace()
        race.state = 'ZZ'
        assertValidationError(race, 'state', 'race.state.not.inList')
    }

    void testDistanceNullConstraint() {
        def race = getValidRace()
        race.distance = null
        assertFalse(race.validate())
    }

    void testDistanceMinConstraint() {
        def race = getValidRace()
        race.distance = -1
        assertValidationError(race, 'distance', 'race.distance.min.notmet')
    }

    void testDistanceMaxConstraint() {
        def race = getValidRace()
        race.distance = 100.0001
        assertValidationError(race, 'distance', 'race.distance.max.exceeded')
    }

    void testCostNullConstraint() {
        def race = getValidRace()
        race.cost = null
        assertFalse(race.validate())
    }

    void testCostMinConstraint() {
        def race = getValidRace()
        race.cost = -1
        assertValidationError(race, 'cost', 'race.cost.min.notmet')
    }

    void testCostMaxConstraint() {
        def race = getValidRace()
        race.cost = 1000.00
        assertValidationError(race, 'cost', 'race.cost.max.exceeded')
    }
     
    private Race getValidRace() { 
        def race = new Race() 
        race.name = 'Fast 5K' 
        race.startDateTime = new Date().plus(1) // 1 day in the future 
        race.city = 'Somewhere' 
        race.state = 'NC' 
        race.distance = 3.1 
        race.cost = 20.00 
        race.maxRunners = 1000 
 
        // Make sure that we have indeed constructed a valid Race object 
        assertTrue(race.validate()) 
 
        return race 
    } 
 
    private assertValidationError(race, fieldName, errorName) { 
        assertFalse(race.validate()) 
        def fieldError = race.errors.getFieldError(fieldName) 
        def validationError = fieldError.codes.find { it == errorName } 
        assertNotNull(validationError) 
    } 
} 
