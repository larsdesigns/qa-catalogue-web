{* Host Item Entry, https://www.loc.gov/marc/bibliographic/bd773.html *}
{assign var="fieldInstances" value=$record->getFields('773')}
{if !is_null($fieldInstances)}
  <p>
    Host Item{if count($fieldInstances) > 1}s{/if}:
    {foreach from=$fieldInstances item=field name="fields"}
      <span class="773">
        {if isset($field->subfields->i)}
          <span class="relationship-information" title="Relationship information">{$field->subfields->i}</span>,
        {/if}
        {if isset($field->subfields->s)}
          <span class="" title="Uniform title">{$field->subfields->s}</span>,
        {/if}
        {if isset($field->subfields->t)}
          <span class="title" title="Title">{$field->subfields->t}</span>,
        {/if}
        {if isset($field->subfields->a)}
          <span class="main-entry" title="Main entry heading"><em>{$field->subfields->a}</em></span>,
        {/if}
        {if isset($field->subfields->b)}
          <span class="edition" title="Edition">{$field->subfields->b}</span>,
        {/if}
        {if isset($field->subfields->d)}
          <span class="place-publisher-dates" title="Place, publisher, and date of publication">{$field->subfields->d}</span>,
        {/if}
        {if isset($field->subfields->g)}
          <span class="related-parts" title="Related parts">{$field->subfields->g}</span>,
        {/if}
        {if isset($field->subfields->h)}
          <span class="physical-description" title="Physical description">{$field->subfields->h}</span>,
        {/if}
        {if isset($field->subfields->k)}
          <span class="series-data" title="Series data for related">{$field->subfields->k}</span>,
        {/if}
        {if isset($field->subfields->m)}
          <span class="" title="Material-specific details">{$field->subfields->m}</span>,
        {/if}
        {if isset($field->subfields->n)}
          <span class="" title="Note">{$field->subfields->n}</span>,
        {/if}
        {if isset($field->subfields->o)}
          <span class="" title="Other item identifier">{$field->subfields->o}</span>,
        {/if}
        {if isset($field->subfields->p)}
          <span class="" title="Abbreviated title">{$field->subfields->p}</span>,
        {/if}
        {if isset($field->subfields->q)}
          <span class="" title="Enumeration and first page">{$field->subfields->q}</span>,
        {/if}
        {if isset($field->subfields->r)}
          <span class="" title="Report number">{$field->subfields->r}</span>,
        {/if}
        {if isset($field->subfields->u)}
          <span class="title" title="Standard Technical Report Number">{$field->subfields->u}</span>,
        {/if}
        {if isset($field->subfields->x)}
          ISSN: <span class="issn" title="International Standard Serial Number">{$field->subfields->x}</span>,
        {/if}
        {if isset($field->subfields->y)}
          CODEN: <span class="title" title="CODEN designation">{$field->subfields->y}</span>,
        {/if}
        {if isset($field->subfields->z)}
          ISBN: <span class="ISBN" title="International Standard Book Number">{$field->subfields->z}</span>,
        {/if}
        {if property_exists($field->subfields, '3')}
          <span class="" title="Materials specified">{$field->subfields->{'3'}}</span>,
        {/if}
        {if property_exists($field->subfields, '4')}
          <span class="" title="Relationship">{$field->subfields->{'4'}}</span>,
        {/if}
        {if property_exists($field->subfields, '6')}
          <span class="" title="Linkage">{$field->subfields->{'6'}}</span>,
        {/if}
        {if property_exists($field->subfields, '7')}
          <span class="" title="Control subfield">{$field->subfields->{'7'}}</span>,
        {/if}
        {if property_exists($field->subfields, '8')}
          <span class="" title="Field link and sequence number">{$field->subfields->{'8'}}</span>,
        {/if}
        {if isset($field->subfields->w)}
          <span class="record-control-number">
            <a href="{$record->link($controller->getSolrField('035', 'a'), $field->subfields->w)}"
               class="record-link">{$field->subfields->w}</a>
          </span>
        {/if}
      </span>
      {if !$smarty.foreach.fields.last}<br/>{/if}
    {/foreach}
  <p>
{/if}
