{let $list_items=fetch( content, tree, hash( parent_node_id, 2,
                                             offset, first_set( $view_parameters.offset, 0 ),
                                             sort_by, array( array( 'modified', false() ) ),
                                             limit, 05,
    'class_filter_type', 'include',
    'class_filter_array', array( 'forum_reply','forum_topic' )

 ) )
     $list_count=fetch( content, tree_count, hash( parent_node_id, 2,
                                                   offset, first_set( $view_parameters.offset, 0),
						   limit, 05,
    'class_filter_type', 'include',
    'class_filter_array', array( 'forum_reply','forum_topic' )

                                                  ) )
}
{*
     $langArray=cond(is_set( $langcode ), array( $langcode ), true(), false() )
     $articleCount=fetch( 'content', 'tree_count', hash(
    'parent_node_id', 2,
    'class_filter_type', 'include',
    'class_filter_array', array( 'wiki_article' ),
    'language', $langArray
    ))
{$articleCount} {$content|wash}
*}

  <div class="content-view-children" style="padding-left: 1.37%; padding-bottom: 10px;">
   <span class="rss-link"><a href="/rss/updated/discussion"><img src={'images/icons/feed/feed-icon-16x16.png'|ezdesign} alt="ezpedia.org discussions rss feed"/></a></span>

    {* <ul> *}
    {section var=child loop=$list_items show=$list_items sequence=array(bglight,bgdark)}
     {* <div>{node_view_gui view=line content_node=$child}</div> *}
     {* $child.object|attribute(show,1)}{break *}
     {if $child.class_identifier|eq('forum_topic')}
     <div style="list-style-type: none;font-size: xx-small; margin-top: 9px;">
     {* <a style="font-size: xx-small;" href={$child.parent.parent.url|ezurl}>{$child.parent.parent.name}</a> : *}
     <a style="font-size: medium" href={concat( $child.url, '#msg', $child.node_id )|ezurl}>{$child.name|wash}</a></div>

     {* <ul style="list-style-type: none;">*} <span style="font-size: xx-small;"> {* @{$child.object.current_version} | *} <span style="font-size: xx-small">{$child.object.current.modified|datetime( 'custom', '%Y/%m/%d @ %H:%i:%s' )}</span> : <a style="font-size: xx-small;" href={$child.object.current.creator.main_node.url|ezurl}>{$child.object.current.creator.name}</a> {* : <a href={concat( '/content/history/', $child.object.id )|ezurl}>History</a>  {if $child.object.data_map.changelog.data_text|is_set}{$child.object.data_map.changelog.data_text}{/if *}</span>{* </ul> *}
     {/if}
     {if $child.class_identifier|eq('forum_reply')}
     <div style="list-style-type: none;font-size: xx-small; margin-top: 9px;"><a style="font-size: medium" href={concat( $child.parent.url, '#msg', $child.node_id )|ezurl}>{$child.parent.name|wash}</a></div>

     {* <ul style="list-style-type: none;">*} <span style="font-size: xx-small;"> {* @{$child.object.current_version} | *} <span style="font-size: xx-small">{$child.object.current.modified|datetime( 'custom', '%Y/%m/%d @ %H:%i:%s' )}</span> : <a style="font-size: xx-small;" href={$child.object.current.creator.main_node.url|ezurl}>{$child.object.current.creator.name}</a> 
     : <a style="font-size: xx-small;" href={concat( $child.parent.url, '#msg', $child.node_id )|ezurl}>{$child.name}</a>
     {* : <a href={concat( '/content/history/', $child.object.id )|ezurl}>History</a> 
    <a style="font-size: xx-small;" href={$child.parent.url|ezurl}>{$child.parent.name}</a>
    {if $child.object.data_map.changelog.data_text|is_set}{$child.object.data_map.changelog.data_text}{/if *}</span>{* </ul> *}
     {/if}
     {section-else}
       <p>{"There is no new content since your last visit."|i18n("design/standard/content/newcontent")}</p>
     {/section}
    {* </ul> *}
   </div>
{/let}