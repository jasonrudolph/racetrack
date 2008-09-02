  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <meta name="layout" content="main" />
         <title>Show Registration</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">Registration List</g:link></span>
            <span class="menuButton"><g:link action="create">New Registration</g:link></span>
        </div>
        <div class="body">
           <h1>Show Registration</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <div class="dialog">
                 <table>
                   
                   <tbody>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Id:</td>
                              
                                    <td valign="top" class="value">${registration.id}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Name:</td>
                              
                                    <td valign="top" class="value">${registration.name}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Date Of Birth:</td>
                              
                                    <td valign="top" class="value">${registration.dateOfBirth}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Gender:</td>
                              
                                    <td valign="top" class="value">${registration.gender}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Postal Address:</td>
                              
                                    <td valign="top" class="value">${registration.postalAddress}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Email Address:</td>
                              
                                    <td valign="top" class="value">${registration.emailAddress}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Race:</td>
                              
                                    <td valign="top" class="value"><g:link controller="race" action="show" id="${registration?.race?.id}">${registration?.race}</g:link></td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Created At:</td>
                              
                                    <td valign="top" class="value">${registration.createdAt}</td>
                              
                        </tr>
                   
                   </tbody>
                 </table>
           </div>
           <div class="buttons">
               <g:form controller="registration">
                 <input type="hidden" name="id" value="${registration?.id}" />
                 <span class="button"><g:actionSubmit value="Edit" /></span>
                 <span class="button"><g:actionSubmit value="Delete" /></span>
               </g:form>
           </div>
        </div>
    </body>
</html>
