<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="content-center">
    <h1 style="text-align: center">Registration</h1>
    <hr>
    <form action="/activate" method="post">
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" id="code" required name="code">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Activate</button>
    </form>
    </div>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>