  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Race List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="create">New Race</g:link></span>
        </div>
        <div class="body">
           <h1>Race List</h1>
            <g:if test="${flash.message}">
                 <div class="message">
                       ${flash.message}
                 </div>
            </g:if>
           <table>
             <thead>
               <tr>
                   	    <g:sortableColumn property="name" title="Name" />
                  
                   	    <g:sortableColumn property="startDateTime" title="Start Date Time" />
                  
                   	    <g:sortableColumn property="city" title="City" />
                  
                   	    <g:sortableColumn property="state" title="State" />
                  
                   	    <g:sortableColumn property="distance" title="Distance" />
                  
                        <th></th>
               </tr>
             </thead>
             <tbody>
               <g:each in="${raceList}">
                    <tr>
                            <td>${it.name?.encodeAsHTML()}</td>
                       
                            <td><g:formatDate date="${it.startDateTime}" format="yyyy-MMM-dd HH:mm"/></td>
                       
                            <td>${it.city?.encodeAsHTML()}</td>
                       
                            <td>${it.state?.encodeAsHTML()}</td>
                       
                            <td><g:formatNumber number="${it.distance}" format="##0.0 mi"/></td>
                       
                       <td class="actionButtons">
                            <span class="actionButton"><g:link action="show" id="${it.id}">Show</g:link></span>
                       </td>
                    </tr>
               </g:each>
             </tbody>
           </table>
               <div class="paginateButtons">
                   <g:paginate total="${Race.count()}" />
               </div>
        </div>
    </body>
</html>
