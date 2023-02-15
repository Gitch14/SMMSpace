<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="content-center">
    <h1 style="text-align: center">Password recover</h1>
    <hr>
        <form action="/recover-mail" method="post">
            <div class="form-group">
                <label for="password">Email</label>
                <input type="email" class="form-control" id="code" required name="email">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" style="width: 100%" class="btn btn-dark">Send</button>
        </form>
    <form action="/recover" method="post">
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" id="code" required name="code">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="text" class="form-control" id="code" required name="passwordRepeat">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Save</button>
    </form>
    </div>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>