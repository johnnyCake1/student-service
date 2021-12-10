<#import "parts/common.ftlh" as c>


<@c.page>

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#postMessage" role="button" aria-expanded="false"
       aria-controls="postMessage">
        Edit message
    </a>

    <a class="btn btn-primary" data-bs-toggle="collapse" href="#searchMessage" role="button" aria-expanded="false"
       aria-controls="searchMessage">
        Search messages
    </a> <br>

    <div class="collapse my-2" id="searchMessage">
        <div class="card card-body shadow-sm">
            <form method="get" action="/main">
                <div class="row">
                    <div class="col">
                        <input class="form-control" type="text" name="filter" value="${filter!}"
                               placeholder="Enter filter">
                    </div>
                    <div class="col">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <#include "parts/messageEdit.ftlh"/>

    <#include "parts/messageList.ftlh"/>

</@c.page>