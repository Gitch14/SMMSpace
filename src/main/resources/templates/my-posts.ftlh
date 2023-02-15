<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My Posts</h1>
    <hr>
    <div class="card-columns">
        <#list posts as post>
            <a href="/post/${post.id}" class="post-link">
                <div class="card text-white bg-dark my-3 post">
                    <div class="card-top">
                        <form action="/post/delete/${post.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Delete
                            </button>
                        </form>
                    </div>
                    <img src="/images/${post.previewImageId}"
                         class="img">
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                    </div>
                    <div class="card-footer">
                        ${post.type}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>



</@t.template>