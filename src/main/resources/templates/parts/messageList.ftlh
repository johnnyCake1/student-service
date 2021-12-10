<#include "security.ftlh">


<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 my-2">
    <#list messages as message>
        <div class="col">
            <div class="card shadow-sm">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" alt="image" class="card-img-top">
                    </#if>
                </div>
                <div class="card-body" id=">${message.id}">
                    <div class="d-flex justify-content-between mb-2">
                        <a href="/user-messages/ ${message.author.id}"><h5 class="card-title">${message.authorName}</h5>
                        </a>
                        <#if message.author.id = currentUserId || isAdmin>
                            <a class="btn-sm btn-primary"
                               href="/user-messages/${message.author.id}?message=${message.id}">Edit</a>
                        </#if>
                    </div>
                    <p class="card-text">${message.text}</p>
                    <h6 class="card-subtitle text-muted fst-italic">#${message.tag}</h6>
                </div>
            </div>
        </div>
    <#else>
        No messages!
    </#list>
</div>