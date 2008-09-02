<html> 
  <head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
    <meta name="layout" content="public" /> 
    <title>Register</title> 
  </head> 
  <body> 
  <div class="body"> 
      <div class="nav"> 
          <g:render template="/adminmenubar" /> 
      </div>
      <h1>Register for ${race.name} </h1> 
      <em>Start Date: 
        <g:formatDate date="${race.startDateTime}" format="EEE, MMM d, yyyy"/> 
        <br /> 
      </em> 
      <em>Start Time: 
        <g:formatDate date="${race.startDateTime}" format="h:mm a z"/> 
        <br /> 
      </em> 
      <g:if test="${flash.message}"> 
        <div class="message">${flash.message}</div> 
      </g:if> 
      <g:hasErrors bean="${registration}"> 
        <div class="errors"> 
          <g:renderErrors bean="${registration}" as="list" /> 
        </div> 
      </g:hasErrors> 
      <g:form action="register" method="post" > 
        <g:hiddenField name="race.id" value="${race.id}" /> 
        <div class="dialog"> 
        <table> 
          <tr class='prop'> 
            <td valign='top' class='name'><label for='name'>Name:</label></td> 
            <td valign='top'  
            class='value ${hasErrors(bean:registration,field:'name','errors')}'> 
              <input type="text" maxlength='50' name='name'  
                value='${registration?.name}'></input> 
            </td> 
          </tr> 
          <tr class='prop'> 
            <td valign='top' class='name'> 
              <label for='dateOfBirth'>Date Of Birth:</label> 
            </td> 
            <td valign='top'  
            class='value ${hasErrors(bean:registration,field:'dateOfBirth','errors')}'> 
              <g:datePicker name='dateOfBirth' value='${registration?.dateOfBirth}'  
                precision='day'></g:datePicker> 
            </td> 
          </tr> 
          <tr class='prop'> 
            <td valign='top' class='name'><label for='gender'>Gender:</label></td> 
            <td valign='top' class='value  
              ${hasErrors(bean:registration,field:'gender','errors')}'> 
              <g:radio name='gender' value='M'  
                checked='${registration?.gender?.equals("M")}' ></g:radio>Male 
              <g:radio name='gender' value='F'  
                checked='${registration?.gender?.equals("F")}' ></g:radio>Female 
            </td> 
          </tr> 
          <tr class='prop'> 
            <td valign='top' class='name'> 
              <label for='postalAddress'>Postal Address:</label> 
            </td> 
            <td valign='top'  
            class='value ${hasErrors(bean:registration,field:'postalAddress','errors')}'> 
              <textarea rows='3' cols='30' name='postalAddress'> 
                ${registration?.postalAddress} 
              </textarea> 
            </td> 
          </tr> 
          <tr class='prop'> 
            <td valign='top' class='name'> 
              <label for='emailAddress'>Email Address:</label> 
            </td> 
            <td valign='top'  
            class='value ${hasErrors(bean:registration,field:'emailAddress','errors')}'> 
              <input type="text" maxlength='50' name='emailAddress'  
                value='${registration?.emailAddress}'></input> 
            </td> 
          </tr> 
        </table> 
        </div> 
        <div class="buttons"> 
          <input type="submit" value="Register" class="formbutton"></input> 
          <input type="button" value="Cancel" onClick="history.back()"  
            class="formbutton"></input> 
        </div> 
      </g:form> 
    </div> 
  </body> 
</html> 
