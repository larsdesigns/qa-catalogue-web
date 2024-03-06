{*
 * value
 * suffix
 * prefix
 *}
{if is_bool($value)}{if $value}{_('true')}{else}{_('false')}{/if}{$suffix}
{elseif is_null($value)}&mdash;{$suffix}
{elseif is_string($value)}{$value}{$suffix}
{elseif is_array($value)}
  {if empty($value)}&mdash;{$suffix}
  {else}
    [{foreach from=$value item=item name=list}{include 'common/parameters-object-value.tpl' value=$item suffix=(($smarty.foreach.list.last) ? '' : ',')}{/foreach}]{$suffix}
  {/if}
{elseif is_object($value)}
  {literal}{{/literal}{foreach from=get_object_vars($value) key=key item=item name=list}{$key}: {include 'common/parameters-object-value.tpl' value=$item suffix=(($smarty.foreach.list.last) ? '' : ',')}{/foreach}{literal}}{/literal}{$suffix}
{else}{json_encode($value1)} ({gettype($value1)}){/if}
