  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>User List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="create">New User</g:link></span>
            <g:render template="/adminmenubar" />
        </div>
        <div class="body">
           <h1>User List</h1>
            <g:if test="${flash.message}">
                 <div class="message">
                       ${flash.message}
                 </div>
            </g:if>
           <table>
             <thead>
               <tr>
               
                   	    <g:sortableColumn property="id" title="Id" />
                  
                   	    <g:sortableColumn property="userId" title="User Id" />
                  
                   	    <g:sortableColumn property="password" title="Password" />
                  
                        <th></th>
               </tr>
             </thead>
             <tbody>
               <g:each in="${userList}">
                    <tr>
                       
                            <td>${it.id?.encodeAsHTML()}</td>
                       
                            <td>${it.userId?.encodeAsHTML()}</td>
                       
                            <td>${it.password?.encodeAsHTML()}</td>
                       
                       <td class="actionButtons">
                            <span class="actionButton"><g:link action="show" id="${it.id}">Show</g:link></span>
                       </td>
                    </tr>
               </g:each>
             </tbody>
           </table>
               <div class="paginateButtons">
                   <g:paginate total="${User.count()}" />
               </div>
        </div>
    </body>
</html>
