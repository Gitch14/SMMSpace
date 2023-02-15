<#import "blocks/template.ftlh" as t>
<@t.template user>
  <div class="content-center" style="background: url('https://i.ibb.co/VTw9k1r/Desktop-7.png') no-repeat center center fixed!important; padding: 100px;border-radius: 80px">
<div class="coll" id="collapseExample" style="">
  <form action="/post/create" method="post" enctype="multipart/form-data">
    <h1 class="create-h1">Create your post</h1>
    <div class="form-group">
      <label for="productName">Post name</label>
      <input type="text" required class="form-control"
             id="productName" name="title">
    </div>
    <div class="form-group">
      <label for="searchCity">Type</label>
      <select id="searchCity" required name="type" class="form-control">
        <option value="">Type</option>

        <option value="SMM">SMM</option>
        <option value="Graphic design">Graphic design</option>
        <option value="Web design">Web design</option>

      </select>
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea class="form-control" id="description" name="description" required></textarea>
    </div>
    <div class="form-group">
      <div class="custom-file">
        <input required type="file" name="file1" id="file1">
        <label class="custom-file-label" for="file1">Main image</label>
      </div>
    </div>
    <div class="form-group">
      <div class="custom-file">
        <input type="file" name="file2" id="file2">
        <label class="custom-file-label" for="file2">Second image</label>
      </div>
    </div>
    <div class="form-group">
      <div class="custom-file">
        <input type="file" name="file3" id="file3">
        <label class="custom-file-label" for="file3">Third image</label>
      </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

    <button type="submit" style="width: 100%" class="btn btn-dark">Add</button>
  </form>
</div>
  </div>


</@t.template>