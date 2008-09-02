  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
          <meta name="layout" content="main" />
         <title>Show Race</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">Race List</g:link></span>
            <span class="menuButton"><g:link action="create">New Race</g:link></span>
        </div>
        <div class="body">
           <h1>Show Race</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <div class="dialog">
                 <table>
                   
                   <tbody>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Id:</td>
                              
                                    <td valign="top" class="value">${race.id}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Name:</td>
                              
                                    <td valign="top" class="value">${race.name}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Start Date Time:</td>
                              
                                    <td valign="top" class="value">${race.startDateTime}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">City:</td>
                              
                                    <td valign="top" class="value">${race.city}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">State:</td>
                              
                                    <td valign="top" class="value">${race.state}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Distance:</td>
                              
                                    <td valign="top" class="value">${race.distance}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Cost:</td>
                              
                                    <td valign="top" class="value">${race.cost}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Max Runners:</td>
                              
                                    <td valign="top" class="value">${race.maxRunners}</td>
                              
                        </tr>
                   
                        <tr class="prop">
                              <td valign="top" class="name">Registrations:</td>
                              
                                     <td  valign="top" style="text-align:left;" class="value">
                                        <ul>
                                            <g:each var="r" in="${race.registrations}">
                                                <li><g:link controller="registration" action="show" id="${r.id}">${r}</g:link></li>
                                            </g:each>
                                        </ul>
                                     </td>
                              
                        </tr>
                   
                   </tbody>
                 </table>
           </div>
           <div class="buttons">
               <g:form controller="race">
                 <input type="hidden" name="id" value="${race?.id}" />
                 <span class="button"><g:actionSubmit value="Edit" /></span>
                 <span class="button"><g:actionSubmit value="Delete" /></span>
               </g:form>
           </div>
        </div>
    </body>
</html>
