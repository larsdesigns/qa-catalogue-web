{if  !is_null($record->getFields('044K'))
  || !is_null($record->getFields('045A'))
  || !is_null($record->getFields('045B'))
  || !is_null($record->getFields('045F'))
  || !is_null($record->getFields('045R'))}
<tr>
  <td class="record-field-label">Schlagwortfolge:</td>
  <td>
    {assign var="fieldInstances" value=$record->getFields('044K')}
    {if !is_null($fieldInstances)}
      {foreach from=$fieldInstances item=field name="fields"}
        {if isset($field->subfields->a) || isset($field->subfields->A)}
          {if property_exists($field->subfields, '9')}
            <a href="?tab=data&query=044K9_ss:{$field->subfields->{'9'}}">
              {if isset($field->subfields->a)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
              {if isset($field->subfields->g)}(<span class="044K$g">{include 'data/subfield.tpl' value=$field->subfields->g}</span>){/if}
              {if isset($field->subfields->A)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->A}</span>{/if}
              {if isset($field->subfields->G)}(<span class="044K$G">{include 'data/subfield.tpl' value=$field->subfields->G}</span>){/if}
            </a>
          {else}
            <span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/if}
          {if !$smarty.foreach.fields.last}<br/>{/if}
        {/if}
      {/foreach}
    {/if}

    {assign var="fieldInstances" value=$record->getFields('045A')}
    {if !is_null($fieldInstances)}
      {foreach from=$fieldInstances item=field name="fields"}
        {if isset($field->subfields->a) || isset($field->subfields->A)}
          {if property_exists($field->subfields, '9')}
            <a href="?tab=data&query=045B9_ss:{$field->subfields->{'9'}}">
              {if isset($field->subfields->a)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
              {if isset($field->subfields->g)}(<span class="044K$g">{include 'data/subfield.tpl' value=$field->subfields->g}</span>){/if}
              {if isset($field->subfields->A)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->A}</span>{/if}
              {if isset($field->subfields->G)}(<span class="044K$G">{include 'data/subfield.tpl' value=$field->subfields->G}</span>){/if}
            </a>
          {else}
            <span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/if}
          {if !$smarty.foreach.fields.last}<br/>{/if}
        {/if}
       {/foreach}
      {/if}

    {assign var="fieldInstances" value=$record->getFields('045B')}
    {if !is_null($fieldInstances)}
      {foreach from=$fieldInstances item=field name="fields"}
        {if isset($field->subfields->a) || isset($field->subfields->A)}
          {if property_exists($field->subfields, '9')}
            <a href="?tab=data&query=045B9_ss:{$field->subfields->{'9'}}">
              {if isset($field->subfields->a)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
              {if isset($field->subfields->g)}(<span class="044K$g">{include 'data/subfield.tpl' value=$field->subfields->g}</span>){/if}
              {if isset($field->subfields->A)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->A}</span>{/if}
              {if isset($field->subfields->G)}(<span class="044K$G">{include 'data/subfield.tpl' value=$field->subfields->G}</span>){/if}
            </a>
          {else}
            <span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/if}
          {if !$smarty.foreach.fields.last}<br/>{/if}
        {/if}
      {/foreach}
    {/if}

    {assign var="fieldInstances" value=$record->getFields('045F')}
    {if !is_null($fieldInstances)}
      {foreach from=$fieldInstances item=field name="fields"}
        {if isset($field->subfields->a) || isset($field->subfields->A)}
          {if property_exists($field->subfields, '9')}
            <a href="?tab=data&query=045B9_ss:{$field->subfields->{'9'}}">
              {if isset($field->subfields->a)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
              {if isset($field->subfields->g)}(<span class="044K$g">{include 'data/subfield.tpl' value=$field->subfields->g}</span>){/if}
              {if isset($field->subfields->A)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->A}</span>{/if}
              {if isset($field->subfields->G)}(<span class="044K$G">{include 'data/subfield.tpl' value=$field->subfields->G}</span>){/if}
            </a>
          {else}
            <span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/if}
          {if !$smarty.foreach.fields.last}<br/>{/if}
        {/if}
      {/foreach}
    {/if}

    {assign var="fieldInstances" value=$record->getFields('045R')}
    {if !is_null($fieldInstances)}
      {foreach from=$fieldInstances item=field name="fields"}
        {if isset($field->subfields->a) || isset($field->subfields->A)}
          {if property_exists($field->subfields, '9')}
            <a href="?tab=data&query=045B9_ss:{$field->subfields->{'9'}}">
              {if isset($field->subfields->a)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>{/if}
              {if isset($field->subfields->g)}(<span class="044K$g">{include 'data/subfield.tpl' value=$field->subfields->g}</span>){/if}
              {if isset($field->subfields->A)}<span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->A}</span>{/if}
              {if isset($field->subfields->G)}(<span class="044K$G">{include 'data/subfield.tpl' value=$field->subfields->G}</span>){/if}
            </a>
          {else}
            <span class="044K$a">{include 'data/subfield.tpl' value=$field->subfields->a}</span>
          {/if}
          {if !$smarty.foreach.fields.last}<br/>{/if}
        {/if}
      {/foreach}
    {/if}
  </td>
</tr>
{/if}
