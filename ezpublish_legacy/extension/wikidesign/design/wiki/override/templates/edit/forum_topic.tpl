{* Forum topic - Edit *}

<div id="columns">
<div id="leftmenu">
    <div id="wiki_title">
        {include uri="design:page_logo.tpl"}
    </div>

    {include uri="design:menubox/edit.tpl"}
</div>

<div id="maincontent">
    <div id="maincontent-design">

    <div class="edit">
        <div class="class-forum-topic">

        <form enctype="multipart/form-data" method="post" action={concat( "/content/edit/", $object.id, "/", $edit_version, "/", $edit_language|not|choose( concat( $edit_language, "/" ), '' ) )|ezurl}>

        <h1>{"Edit %1 - %2"|i18n("design/base",,array($class.name|wash,$object.name|wash))}</h1>

        {include uri="design:content/edit_validation.tpl"}

        <div style="display:none;">
            <input type="hidden" name="UseNodeAssigments" value="0" />
        </div>

        <input type="hidden" name="MainNodeID" value="{$main_node_id}" />

        <h3>{'Subject'|i18n('design/base')}</h3>
        {attribute_edit_gui attribute=$object.data_map.subject}
        <h3>{'Message'|i18n('design/base')}</h3>
        {attribute_edit_gui attribute=$object.data_map.message}

        <h3>{'Notify me about updates'|i18n('design/base')}</h3>
        {attribute_edit_gui attribute=$object.data_map.notify_me}

        {let current_user=fetch( 'user', 'current_user' )
             sticky_groups=ezini( 'ForumSettings', 'StickyUserGroupArray', 'forum.ini' )}

            {section var=sticky loop=$sticky_groups}
                {section show=$current_user.groups|contains($sticky)}
                <h3>{'Sticky'|i18n('design/base')}</h3>
                {attribute_edit_gui attribute=$object.data_map.sticky}
                {/section}
            {/section}
        {/let}

        <br/>

        <div class="buttonblock">
            <input class="defaultbutton" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/base')}" />
            <input class="button" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/base')}" />
            <input type="hidden" name="DiscardConfirm" value="0" />
	    {def $discardRedirectNode=fetch( 'content', 'node', hash( 'node_id', $main_node_id ) )
	    $publishRedirectNode=fetch( 'content', 'node', hash( 'node_id', $object.main_node_id ) )}
            <input type="hidden" name="RedirectURIAfterPublish" value="{$publishRedirectNode.url}" />
       	    <input type="hidden" name="RedirectIfDiscarded" value="{$discardRedirectNode.url}" />
	    
        </div>
        </form>

        </div>
    </div>

    </div>
</div>

<div class="break"></div>

</div>
