{assign var="fieldInstances" value=$record->getFields('006G')}
{if !is_null($fieldInstances)}
<tr>
  <td class="record-field-label">DNB-Nr.:</td>
  <td>
    {foreach from=$fieldInstances item=field name="fields"}
      {if property_exists($field->subfields, '0')}<span class="006G$0">{include 'data/subfield.tpl' value=$field->subfields->{'0'}}</span>{/if}
      {if !$smarty.foreach.fields.last}<br/>{/if}
    {/foreach}
  </td>
</tr>
{/if}
