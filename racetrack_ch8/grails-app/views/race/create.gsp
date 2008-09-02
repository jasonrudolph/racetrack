  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="main" />
         <title>Create Race</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link action="list">Race List</g:link></span>
            <g:render template="/adminmenubar" />
        </div>
        <div class="body">
           <h1>Create Race</h1>
           <g:if test="${flash.message}">
                 <div class="message">${flash.message}</div>
           </g:if>
           <g:hasErrors bean="${race}">
                <div class="errors">
                    <g:renderErrors bean="${race}" as="list" />
                </div>
           </g:hasErrors>
           <g:form action="save" method="post" >
               <div class="dialog">
                <table>
                    <tbody>

                       
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='name'>Name:</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'name','errors')}'><input type="text" maxlength='50' name='name' value="${race?.name?.encodeAsHTML()}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='startDateTime'>Start Date Time:</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'startDateTime','errors')}'><g:datePicker name='startDateTime' value="${race?.startDateTime}"></g:datePicker></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='city'>City:</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'city','errors')}'><input type="text" maxlength='30' name='city' value="${race?.city?.encodeAsHTML()}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='state'>State:</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'state','errors')}'><g:select name='state' from='${race.constraints.state.inList.collect{it.encodeAsHTML()}}' value="${race.state?.encodeAsHTML()}"></g:select></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='distance'>Distance (mi):</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'distance','errors')}'><input type='text' name='distance' value="${race?.distance}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='cost'>Cost (US$):</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'cost','errors')}'><input type='text' name='cost' value="${race?.cost}"></input></td></tr>
                       
                                  <tr class='prop'><td valign='top' class='name'><label for='maxRunners'>Max Runners:</label></td><td valign='top' class='value ${hasErrors(bean:race,field:'maxRunners','errors')}'><input type='text' name='maxRunners' value="${race?.maxRunners}"></input></td></tr>
                       
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
