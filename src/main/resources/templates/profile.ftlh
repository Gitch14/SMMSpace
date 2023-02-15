<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Profile</h1>
    <hr>
    <br>
    <div style="text-align: left">
        <img src="/static/images/avatar.png"
             style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
    <div class="description-btn">
        <a class="btn btn-dark mb-3" style="text-align: left; width: 10%"
           href="/description/info">
            Add description
        </a>
        <h2>${user.name}</h2>
        <br>
        <h4>Email: <b>${user.email}</b></h4>
        <br>
        <h4>Description: </h4> <br>
        <p><b>${user.description}</b></p>
        <br>
        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/admin">
                Panel administration
            </a><br>
        </#if>
    <div class="profile-btn">
        <a class="btn btn-dark mb-3" style="text-align: center; width: 50%"
           href="/my/posts">
            My posts
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 50%" class="btn btn-danger mb-2">
                LogOut
            </button>
        </form>
    </div>
    </div>
</@t.template>