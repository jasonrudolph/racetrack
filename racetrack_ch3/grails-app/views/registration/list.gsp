
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Registration List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="create">New Registration</g:link></span>
        </div>
        <div class="body">
           <h1>Registration List</h1>
            <g:if test="${flash.message}">
                 <div class="message">
                       ${flash.message}
                 </div>
            </g:if>
           <table>
               <tr>
                   
                                      
                        <th>Id</th>
                                      
                        <th>Name</th>
                                      
                        <th>Date Of Birth</th>
                                      
                        <th>Gender</th>
                                      
                        <th>Postal Address</th>
                                      
                        <th>Email Address</th>
                   
                   <th></th>
               </tr>
               <g:each in="${registrationList}">
                    <tr>
                       
                            <td>${it.id}</td>
                       
                            <td>${it.name}</td>
                       
                            <td>${it.dateOfBirth}</td>
                       
                            <td>${it.gender}</td>
                       
                            <td>${it.postalAddress}</td>
                       
                            <td>${it.emailAddress}</td>
                       
                       <td class="actionButtons">
                            <span class="actionButton"><g:link action="show" id="${it.id}">Show</g:link></span>
                       </td>
                    </tr>
               </g:each>
           </table>
		   <div class="paginateButtons">
				<g:paginate total="${Registration.count()}" />
			</div>
        </div>
    </body>
</html>
            