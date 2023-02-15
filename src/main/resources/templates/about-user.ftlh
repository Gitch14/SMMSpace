<#import "blocks/template.ftlh" as t>
<@t.template user>
  <div class="content-center" style="background: url('https://i.ibb.co/VTw9k1r/Desktop-7.png') no-repeat center center fixed!important; padding: 100px;border-radius: 80px">
<div class="coll" id="collapseExample" style="">
  <form action="/description/info/${user.id}" method="post" enctype="multipart/form-data">
    <h1 class="create-h1">Create your post</h1>

    <div class="form-group">
      <label for="description">Description</label>
      <textarea class="form-control" id="description" name="description" required></textarea>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <button type="submit" style="width: 100%" class="btn btn-dark">Add</button>
  </form>
</div>
  </div>


</@t.template>