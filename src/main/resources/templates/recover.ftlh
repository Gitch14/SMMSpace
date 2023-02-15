<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="content-center">
    <h1 style="text-align: center">Reset password</h1>
    <hr>
        <form action="/recover" method="post">
            <div class="form-group">
                <label for="password">Email</label>
                <input type="email" class="form-control" id="email" required name="email">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" style="width: 100%" class="btn btn-dark">Send</button>
        </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>