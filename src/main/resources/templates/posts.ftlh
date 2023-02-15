<#import "blocks/template.ftlh" as t>
<@t.template user>

    <div class="card-columns">
        <#list posts as post>
            <a href="/post/${post.id}" class="post-link">
                <div class="card my-3 post">

                    <img src="https://i.ibb.co/0DBykf3/graphic-tablet-1-2.png"
                         class="img">
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                    </div>
                    <div class="card-footer">
                        <p>Type : ${post.type}</p>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>