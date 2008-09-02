class RaceTrackTagLib { 
    /** 
     * Outputs the given <code>Date</code> object in the specified format.  If 
     * the <code>date</code> is not given, then the current date/time is used. 
     * If the <code>format</code> option is not given, then the date is output 
     * using the default format. 
     * 
     * e.g., <g:formatDate date="${myDate}" format="yyyy-MM-dd HH:mm" /> 
     * 
     * @see java.text.SimpleDateFormat 
     */ 
    def formatDate = { attrs -> 
        def date = attrs.get('date') 
 
        if (!date) { 
                date = new Date() 
        } 
 
        def format = attrs.get('format') 
        if (!format) { 
                format = "yyyy-MM-dd HH:mm:ss z" 
        } 
 
        out << new java.text.SimpleDateFormat(format).format(date) 
    } 
 
    /**
     * Outputs the given number in the specified format.  If no 
     * <code>number</code> is given, then zero is used.  If the 
     * <code>format</code> option is not given, then the number is output 
     * using the default format. 
     * 
     * e.g., <g:formatNumber number="${myNumber}" format="###,##0" /> 
     * 
     * @see java.text.DecimalFormat 
     */ 
    def formatNumber = { attrs -> 
        def number = attrs.get('number') 

        if (!number) { 
                number = new Double(0) 
        } 

        def format = attrs.get('format') 
        if (!format) { 
                format = "0" 
        } 

        out << new java.text.DecimalFormat(format).format((Double)number) 
    } 
}