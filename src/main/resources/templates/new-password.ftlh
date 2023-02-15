<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="content-center">
    <h1 style="text-align: center">Reset password</h1>
    <hr>
        <form action="/new-password" method="post">
            <div class="form-group">
                <label for="code">Code</label>
                <input type="text" class="form-control" id="code" required name="code">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="text" class="form-control" id="pass1" required name="pass1">
            </div>
            <div class="form-group">
                <label for="password">Repeat password</label>
                <input type="text" class="form-control" id="pass2" required name="pass2">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" style="width: 100%" class="btn btn-dark">Save</button>
        </form>
    </div>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>