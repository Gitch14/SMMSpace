<#import "blocks/template.ftlh" as t>
<@t.template user>
   <!-- <img class="bg" src="https://i.ibb.co/pP1mwN9/Desktop-7.png"> -->
    <div class="content-center">
    <h1 style="text-align: center">Login</h1>
    <form action="/login " method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Invalid email
            </div>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Wrong password
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Sing in</button>
    </form>
    <h2>New to SMMSpace? <a href="/registration">Register!</a></h2>
            <h2>Forgot your password?</h2> <a href="/recover">Reset password!</a>
    </div>
    </img>
</@t.template>