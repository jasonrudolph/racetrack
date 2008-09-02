  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Edit User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">User List</g:link></span>
            <span class="menuButton"><g:link action="create">New User</g:link></span>
        </div>
        <div class="body">
           <h1>Edit User</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <g:hasErrors bean="${user}">
                <div class="errors">
                    <g:renderErrors bean="${user}" as="list" />
                </div>
           </g:hasErrors>
           <div class="prop">
	      <span class="name">Id:</span>
	      <span class="value">${user?.id}</span>
           </div>           
           <g:form controller="user" method="post" >
               <input type="hidden" name="id" value="${user?.id}" />
               <div class="dialog">
                <table>
                    <tbody>

                       
                       
				<tr class='prop'><td valign='top' class='name'><label for='userId'>User Id:</label></td><td valign='top' class='value ${hasErrors(bean:user,field:'userId','errors')}'><input type="text" maxlength='8' name='userId' value="${user?.userId?.encodeAsHTML()}"></input></td></tr>
                       
				<tr class='prop'><td valign='top' class='name'><label for='password'>Password:</label></td><td valign='top' class='value ${hasErrors(bean:user,field:'password','errors')}'><input type="text" maxlength='8' name='password' value="${user?.password?.encodeAsHTML()}"></input></td></tr>
                       
                    </tbody>
                </table>
               </div>

               <div class="buttons">
                     <span class="button"><g:actionSubmit value="Update" /></span>
                     <span class="button"><g:actionSubmit value="Delete" /></span>
               </div>
            </g:form>
        </div>
    </body>
</html>
