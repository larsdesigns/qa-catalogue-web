{assign var="fieldInstances" value=$record->getFields('022A')}
{if !is_null($fieldInstances)}
<tr>
  <td class="record-field-label">Einheitssachtitel:</td>
  <td>
    {foreach from=$fieldInstances item=field name="fields"}
      {if isset($field->subfields->a)}<span class="022A$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
      {if !$smarty.foreach.fields.last}<br/>{/if}
    {/foreach}
  </td>
</tr>
{/if}
