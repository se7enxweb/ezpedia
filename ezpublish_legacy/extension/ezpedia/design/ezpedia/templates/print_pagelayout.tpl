{*?template charset=utf8?*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">

<head>
{section name=JavaScript loop=ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) }
    <script language="JavaScript" type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/section}
    <link rel="stylesheet" type="text/css" href={"stylesheets/core.css"|ezdesign} />

<style type="text/css">
{section var=css_file loop=ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' )}
    @import url({concat( 'stylesheets/',$css_file )|ezdesign});
{/section}
</style>
{include uri="design:page_head.tpl" enable_print=false()}
</head>

<body>

{* Main area START *}

<div style="font-size:1.4em; margin-top: 10px; margin-bottom: 15px;"><a href="http://ezpedia.org" target="_self">eZpedia</a> : The Free eZ Publish CMS Documentation Encyclopedia</div>

{include uri="design:page_mainarea.tpl"}

{* Main area END *}

{include uri="design:page_copyright.tpl"}

<!--DEBUG_REPORT-->

</body>
</html>
