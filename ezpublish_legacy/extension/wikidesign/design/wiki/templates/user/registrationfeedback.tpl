{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let site_url=ezini('SiteSettings','SiteURL')}
{set-block scope=root variable=subject}{'New user registered at %siteurl'|i18n('design/wiki/user/register',,hash('%siteurl',ezini('SiteSettings','SiteURL')))}{/set-block}
{'A new user has registered.'|i18n('design/wiki/user/register')}

{'Account information.'|i18n('design/wiki/user/register')}
{'Username'|i18n('design/wiki/user/register','Login name')}: {$user.login}
{'E-mail'|i18n('design/wiki/user/register')}: {$user.email}

{'Link to user information'|i18n('design/wiki/user/register')}:
http://{$site_url}/content/view/full/{$object.main_node_id}
{/let}
