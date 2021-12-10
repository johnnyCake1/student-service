<#macro login path isRegisterForm >

    <div>
        <form method="post" action="${path}">
            <h1 class="h3 mb-3 fw-normal">Please ${isRegisterForm?then("sign up", "sign in")}</h1>
            <div class="form-group row my-2">
                <label class="col-sm-2 col-form-label"> Username : </label>
                <div class="col-sm-6">
                    <input class="form-control ${(usernameError??)?then("is-invalid", '')}"
                           type="text" name="username"
                           value="${(user??)?then(user.username, '')}" placeholder="Username"/>
                    <#if usernameError??>
                        <div class="invalid-feedback">
                            ${usernameError!}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row my-2">
                <label class="col-sm-2 col-form-label"> Password: </label>
                <div class="col-sm-6">
                    <input class="form-control ${(passwordError??)?then("is-invalid", '')}"
                           type="password" name="password"
                           placeholder="Password"/>
                    <#if passwordError??>
                        <div class="invalid-feedback">
                            ${passwordError!}
                        </div>
                    </#if>
                </div>
            </div>
            <#if isRegisterForm>
                <div class="form-group row my-2">
                    <label class="col-sm-2 col-form-label"> Password: </label>
                    <div class="col-sm-6">
                        <input class="form-control ${(passwordConfirmationError??)?then("is-invalid", '')}"
                               type="password" name="passwordConfirmation"
                               placeholder="Retype password"/>
                        <#if passwordConfirmationError??>
                            <div class="invalid-feedback">
                                ${passwordConfirmationError!}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group row my-2">
                    <label class="col-sm-2 col-form-label"> Email: </label>
                    <div class="col-sm-6">
                        <input class="form-control ${(emailError??)?then("is-invalid", '')}"
                               type="email" name="email"
                               value="${(user??)?then(user.email, '')}" placeholder="some@some.com"/>
                        <#if emailError??>
                            <div class="invalid-feedback">
                                ${emailError!}
                            </div>
                        </#if>
                    </div>
                </div>
            </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">${isRegisterForm?then("Sign Up", "Sign In")}</button>
            <div class="mt-2">
                <#if !isRegisterForm>
                    <a href="/registration">Register</a>
                <#else>
                    <a href="/login">Login</a>
                </#if>
            </div>
        </form>
    </div>

</#macro>


<#macro logout>

    <div>
        <form method="post" action="/logout">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit">Sign Out</button>
        </form>
    </div>

</#macro>