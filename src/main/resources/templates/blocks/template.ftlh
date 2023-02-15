<#macro template user>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/static/css/style.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
              crossorigin="anonymous">

        <script async src="https://www.google.com/recaptcha/api.js"></script>

        <title>SMMSpace</title>
    </head>
    <body>
    <nav class="navbar navbar-dark bg-dark1-1">
        <div class="container-fluid">
            <a href="/">
                <span class="navbar-brand-mb-0-h1">SMMSpace</span>
            </a>
            <form method="get" action="/">
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control1"
                               id="searchWord">
                    </div>
                    <button type="submit" class="btn1"></button>
                </div>
            </form>
            <nav>
                <ul id="small-menu">
                    <li><a href="/my/posts">Your Page</a></li>
                    <li><a href="/create">Create</a></li>
                    <li><a href="/about">About</a></li>
                </ul>
            </nav>
            <#if user.email??>
                <div class="dropdown text-end">
                    <a href="/profile">
                        <img src="/static/images/avatar.png" alt="mdo"
                             width="32" height="32" class="rounded-circle">
                    </a>
                </div>
            <#else>
                <button class="btn-btn-light-my-2-my-sm-0" type="button"
                        onclick="window.location.href = '/login'">
                    Sign in
                </button>
            </#if>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>
    <footer class="footer">
        <div class="container">
    <div class="social">
        <a href="#"> <img src="../../static/images/instagram.png"></a>
        <a href="#"> <img src="../../static/images/telegram.png"></a>
        <a href="#"> <img src="../../static/images/slack.png"></a>
        <a href="#"> <img src="../../static/images/twitter.png"></a>
        <a href="#"> <img src="../../static/images/youtube.png"></a>
    </div>
    </div>
</footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>