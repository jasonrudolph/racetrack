  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Create Registration</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">Registration List</g:link></span>
            <g:render template="/adminmenubar" />
        </div>
        <div class="body">
           <h1>Create Registration</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <g:hasErrors bean="${registration}">
                <div class="errors">
                    <g:renderErrors bean="${registration}" as="list" />
                </div>
           </g:hasErrors>
           <g:form action="save" method="post" >
               <div class="dialog">
                <table>
                    <tbody>

                       
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='name'>Name:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'name','errors')}'><input type="text" maxlength='50' name='name' value="${registration?.name?.encodeAsHTML()}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='dateOfBirth'>Date Of Birth:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'dateOfBirth','errors')}'><g:datePicker name='dateOfBirth' value="${registration?.dateOfBirth}" precision='day'></g:datePicker></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='gender'>Gender:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'gender','errors')}'><g:select name='gender' from='${registration.constraints.gender.inList.collect{it.encodeAsHTML()}}' value="${registration.gender?.encodeAsHTML()}"></g:select></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='postalAddress'>Postal Address:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'postalAddress','errors')}'><textarea rows='5' cols='40' name='postalAddress'>${registration?.postalAddress?.encodeAsHTML()}</textarea></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='emailAddress'>Email Address:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'emailAddress','errors')}'><input type="text" maxlength='50' name='emailAddress' value="${registration?.emailAddress?.encodeAsHTML()}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='race'>Race:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'race','errors')}'><g:select optionKey="id" from="${Race.list()}" name='race.id' value="${registration?.race?.id}"></g:select></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='createdAt'>Created At:</label></td><td valign='top' class='value ${hasErrors(bean:registration,field:'createdAt','errors')}'><g:datePicker name='createdAt' value="${registration?.createdAt}"></g:datePicker></td></tr>
                       
                    </tbody>
               </table>
               </div>
               <div class="buttons">
                     <span class="formButton">
                        <input type="submit" value="Create"></input>
                     </span>
               </div>
            </g:form>
        </div>
    </body>
</html>
