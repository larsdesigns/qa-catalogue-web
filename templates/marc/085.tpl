{* Synthesized Classification Number Components
   http://www.loc.gov/marc/bibliographic/bd085.html *}
{assign var="fieldInstances" value=$record->getFields('085')}
{if !is_null($fieldInstances)}
<tr>
  <td><em>synthesized classifications</em>:</td>
  <td>
  {foreach from=$fieldInstances item=field}
    <span class="085">
      {*  Classification number *}
      {if isset($field->subfields->a)}
        <a href="{$record->filter('084a_Classification_classificationPortion_ss', $field->subfields->a)}" class="record-link"
           title="Number where instructions are found-single number or beginning number of span">{include 'data/subfield.tpl' value=$field->subfields->a}</a>
      {/if}

      {if isset($field->subfields->b)}
        <a href="#" class="subdivision" data="085b_SynthesizedClassificationNumber_baseNumber_ss"
           title="Base number">{include 'data/subfield.tpl' value=$field->subfields->b}</a>
      {/if}

      {if isset($field->subfields->c)}
        <span class="subdivision" data="084b"
           title="Classification number-ending number of span">{include 'data/subfield.tpl' value=$field->subfields->c}</span>
      {/if}

      {if isset($field->subfields->f)}
        <span class="subdivision" data="084b"
           title="Facet designator">{include 'data/subfield.tpl' value=$field->subfields->f}</span>
      {/if}

      {if isset($field->subfields->r)}
        <span class="root-number" data="084b"
           title="Root number">{include 'data/subfield.tpl' value=$field->subfields->r}</span>
      {/if}

      {if isset($field->subfields->s)}
        <span class="agency" data="085s_SynthesizedClassificationNumber_fromClassification_ss"
              title="Digits added from classification number in schedule or external table">{include 'data/subfield.tpl' value=$field->subfields->s}</span>
      {/if}

      {if isset($field->subfields->t)}
        <span class="agency" data="084q_Classification_assigner_ss"
              title="Digits added from internal subarrangement or add table">{include 'data/subfield.tpl' value=$field->subfields->t}</span>
      {/if}

      {if isset($field->subfields->u)}
        <span class="agency" data="084q_Classification_assigner_ss"
              title="Number being analyzed">{include 'data/subfield.tpl' value=$field->subfields->u}</span>
      {/if}

      {if isset($field->subfields->v)}
        <span class="agency" data="084q_Classification_assigner_ss"
              title="Number in internal subarrangement or add table where instructions are found">{include 'data/subfield.tpl' value=$field->subfields->v}</span>
      {/if}

      {if isset($field->subfields->w)}
        <span class="agency" data="084q_Classification_assigner_ss"
              title="Table identification-Internal subarrangement or add table">{include 'data/subfield.tpl' value=$field->subfields->w}</span>
      {/if}

      {if isset($field->subfields->y)}
        <span class="agency" data="084q_Classification_assigner_ss"
              title="Table sequence number for internal subarrangement or add table">{include 'data/subfield.tpl' value=$field->subfields->y}</span>
      {/if}

      {if isset($field->subfields->z)}
        <span class="agency" data="085z_SynthesizedClassificationNumber_tableIdentification_ss"
              title="Table identification">{include 'data/subfield.tpl' value=$field->subfields->z}</span>
      {/if}

      {if property_exists($field->subfields, '0')}
        <a href="#" class="source" data="0842_Classification_source_ss"
           title="Authority record control number or standard number">{include 'data/subfield.tpl' value=$field->subfields->{'0'}}</a>
      {/if}
    </span>
    <br/>
  {/foreach}
  </td>
</tr>
{/if}
