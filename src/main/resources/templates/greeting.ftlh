<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">


<@c.page>

    <h5>Hello, <#if name != ''>${name}<#else>guest</#if>!</h5>

    This is a simple Student Service Web Application.

</@c.page>
