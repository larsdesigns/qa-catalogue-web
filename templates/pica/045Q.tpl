{assign var="fieldInstances" value=$record->getFields('045Q')}
{if !is_null($fieldInstances)}
<tr>
  <td class="record-field-label">Sachgebiete:</td>
  <td>
    {foreach from=$fieldInstances item=field name="fields"}
      {if isset($field->subfields->a)}
        {if property_exists($field->subfields, '9')}
          <a href="?tab=data&query=045Q9_ss:{$field->subfields->{'9'}}">{strip}
            <span class="045Q$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/strip}</a>
        {else}
          <span class="045Q$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
        {/if}
      {/if}
      {if isset($field->subfields->j)}<span class="045Q$a">{include 'data/subfield.tpl' value=$field->subfields->j}</span>{/if}
      {if !$smarty.foreach.fields.last}<br/>{/if}
    {/foreach}
  </td>
</tr>
{/if}
