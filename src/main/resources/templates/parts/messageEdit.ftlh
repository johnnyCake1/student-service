<div class="collapse ${(message??)?then('show', '')} my-2" id="postMessage">
    <div class="card card-body shadow-sm">
        <form method="post" enctype="multipart/form-data">
            <div class="row g3">
                <div class="col-4">
                    <input class="form-control ${(textError??)?then("is-invalid", '')}" type="text" name="text"
                           value="${(message??)?then(message.text, '')}" placeholder="Enter message"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError!}
                        </div>
                    </#if>
                </div>
                <div class="col">
                    <input class="form-control ${(tagError??)?then("is-invalid", '')}" type="text" name="tag"
                           value="${(message??)?then(message.tag, '')}" placeholder="Tag"/>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError!}
                        </div>
                    </#if>
                </div>
                <div class="col">
                    <input class="form-control" type="file" name="file">
                </div>
                <div class="col">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
                    <button class="btn btn-primary" type="submit">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
