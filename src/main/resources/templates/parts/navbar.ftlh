<#import "login.ftlh" as l>
<#include "security.ftlh">


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Cwitter</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/main">Messages</a>
                    </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/user-messages/${currentUserId}">My messages</a>
                    </li>
                </#if>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/user">User list</a>
                    </li>
                </#if>
            </ul>
            <#if user??>
                <a class="nav-link active" aria-current="page" href="/user/profile">${name}</a>
            </#if>
            <#if name != ''>
                <@l.logout/>
            <#else >
                <a href="/login" class="btn btn-primary">Sign In</a>
            </#if>
        </div>
    </div>
</nav>