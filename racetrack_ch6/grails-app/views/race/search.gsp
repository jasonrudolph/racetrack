<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html;  
       charset=UTF-8"/> 
        <meta name="layout" content="public" /> 
        <title>Search for Races</title> 
    </head> 
    <body> 
      <div class="nav"> 
         <g:render template="/adminmenubar" /> 
      </div> 
      <div class="body"> 
         <h1>Search for Races</h1> 
         <g:if test="${flash.message}"> 
             <div class="message">${flash.message}</div> 
         </g:if> 
         <g:form action="search" method="post" > 
            <div class="dialog"> 
            <table> 
               <tr class='prop'> 
                  <td valign='top' class='name'> 
                    <label for='city'>City:</label> 
                 </td> 
                 <td valign='top' class='value'> 
                   <input type="text" maxlength='30' name='city'> 
                   </input> 
                 </td> 
               </tr> 
               <tr class='prop'> 
                   <td valign='top' class='name'> 
                       <label for='state'>State:</label> 
                   </td> 
                   <td valign='top' class='value'> 
                       <g:select name='state'  
                   from='${[""] + new Race().constraints.state.inList}'> 
                      </g:select> 
                   </td> 
               </tr> 
             <tr class='prop'> 
                 <td valign='top' class='name'> 
                     <label for='date'>Date:</label> 
                 </td> 
                 <td valign='top' class='value'> 
                     between 
                     <g:datePicker name='minDate' precision='day' /> 
                     and 
                     <g:datePicker name='maxDate' precision='day'  
                  value='${new Date().plus(365*2)}'/> 
                 </td> 
             </tr> 
             <tr class='prop'> 
                 <td valign='top' class='name'> 
                     <label for='distance'>Distance:</label> 
                 </td> 
                 <td valign='top' class='value'> 
                     <select name='distanceOperator' > 
                         <option value='AT_LEAST' >At least</option> 
                         <option value='EXACTLY' >Exactly</option> 
                         <option value='AT_MOST' >At most</option> 
                     </select> 
                     <input type='text' name='distance' size='5'> 
             </input> mi 
                 </td> 
             </tr>
            </table> 
            </div> 
            <div class="buttons"> 
              <input type="submit" value="Search"  
                     class="formbutton"> 
              </input> 
            </div> 
         </g:form> 
      </div> 
    </body> 
</html> 