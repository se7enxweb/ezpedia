{section show=$verify_user_email}
<div class="maincontentheader">
<h1>{"User registered"|i18n("design/standard/user")}</h1>
</div>

<div class="feedback">
<p>
{'Your account was successfully created. An email will be sent to the specified
email address.'|i18n('design/standard/user')}
</p>
<p>
{'Follow the instructions in that mail to activate
your account.'|i18n('design/standard/user')}
</p>
</div>
{section-else}
<div class="maincontentheader">
<h1>{"User registered"|i18n("design/standard/user")}</h1>
</div>

<div class="feedback">
<h2>{"Your account was successfully created."|i18n("design/standard/user")}</h2>
</div>
{/section}

<div class="buttonblock">
<form action={"/"|ezurl} method="get">
    <input class="button" type="submit" value="{'Continue'|i18n( 'design/standard/user' )}" />
</form>
{*
<form action={"/user/register"|ezurl} method="post">
    <input class="button" type="submit" value="{'OK'|i18n( 'design/standard/user' )}" />
</form>*}
</div>