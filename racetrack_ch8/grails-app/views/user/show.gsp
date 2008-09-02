
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <meta name="layout" content="main" />
         <title>Show User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">User List</g:link></span>
            <span class="menuButton"><g:link action="create">New User</g:link></span>
            <g:render template="/adminmenubar" />
        </div>
        <div class="body">
           <h1>Show User</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <div class="dialog">
                 <table>
                   
                   
                        <tr class="prop">
                              <td valign="top" class="name">Id:</td>
                              
                                    <td valign="top" class="value">${user.id}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">User Id:</td>
                              
                                    <td valign="top" class="value">${user.userId}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Password:</td>
                              
                                    <td valign="top" class="value">${user.password}</td>
                              
                        </tr>
                   
                 </table>
           </div>
           <div class="buttons">
               <g:form controller="user">
                 <input type="hidden" name="id" value="${user?.id}" />
                 <span class="button"><g:actionSubmit value="Edit" /></span>
                 <span class="button"><g:actionSubmit value="Delete" /></span>
               </g:form>
           </div>
        </div>
    </body>
</html>
            