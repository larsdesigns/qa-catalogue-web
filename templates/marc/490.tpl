{* Series Statement
   http://www.loc.gov/marc/bibliographic/bd490.html *}
{assign var="fieldInstances" value=$record->getFields('490')}
{if !is_null($fieldInstances)}
  Series:
  <ul>
  {foreach from=$fieldInstances item=field}
    <li>
      {if isset($field->subfields->a)}
        {foreach from=$field->subfields->a item=value name="subfields"}
          <a href="{$record->filter($controller->getSolrField('490', 'a'), $value)}"
             class="record-link tag-490a" data="490a_SeriesStatement_ss">{$value}</a>
            {if !$smarty.foreach.subfields.last}, {/if}
        {/foreach}
      {/if}

      {if isset($field->subfields->l)}
        <span class="subarea" data="490l"
         title="Library of Congress call number">{include 'data/subfield.tpl' value=$field->subfields->l}</span>
      {/if}

      {if isset($field->subfields->v)}
        {foreach from=$field->subfields->v item=value name=values}
          <a href="#" class="record-link subarea" data="490v_SeriesStatement_volume_ss"
         title="Volume/sequential designation">{$value}</a>{if !$smarty.foreach.values.last}, {/if}
        {/foreach}
      {/if}

      {if isset($field->subfields->x)}
        {foreach from=$field->subfields->x item=value name=values}
          <span class="issn" data="490x"
           title="International Standard Serial Number">{$value}</span>{if !$smarty.foreach.values.last}, {/if}
        {/foreach}
      {/if}

      {if property_exists($field->subfields, '3')}
        <a href="#" class="record-link issn" data="4903_SeriesStatement_materialsSpecified_ss"
         title="Materials specified">{$field->subfields->{'3'}}</a>
      {/if}
    </li>
  {/foreach}
  </ul>
{/if}
