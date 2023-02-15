<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <div class="profile-marker">
            <img src="/static/images/avatar.png"
                 style="border:2px solid black; border-radius: 20px" height="120">
        <br>
        <br>
        <h4>Name: ${user.name}</h4>
        <br>
        <h4>Email: <b>${user.email}</b></h4>
        <br>
        <h4>Description: </h4> <br>
        <p><b>${user.description}</b></p>
        <br>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Users post</h1>
    <br>
    <div class="card-columns">
        <#list posts as post>
            <a href="/post/${post.id}" class="post-link">
                <div class="card text-white bg-dark my-3 post">

                    <img src="/images/${post.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                    </div>
                    <div class="card-footer">
                        ${post.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>