{* Main Entry - Uniform Title, https://www.loc.gov/marc/bibliographic/bd130.html *}
{assign var="fieldInstances" value=$record->getFields('130')}
{if !is_null($fieldInstances)}
<tr>
  <td><em>uniform title</em>:</td>
  <td>
  {foreach from=$fieldInstances item=field}
    <span class="130">
      <i class="fa fa-user" aria-hidden="true" title="title"></i>
      <a href="{$record->filter('130a_MainUniformTitle_ss', $field->subfields->a)}" class="record-link" title="Uniform title">{include 'data/subfield.tpl' value=$field->subfields->a}</a>
      {*  *}
      {if isset($field->subfields->b)}
        <span class="date" title="Date of treaty signing">{include 'data/subfield.tpl' value=$field->subfields->b}</span>
      {/if}
      {* 130f_MainUniformTitle_dateOfAWork_ss *}
      {if isset($field->subfields->f)}
        <span class="date-of-a-work" title="Date of a work">{include 'data/subfield.tpl' value=$field->subfields->f}</span>
      {/if}
      {* 130g_MainUniformTitle_miscellaneous_ss *}
      {if isset($field->subfields->g)}
        <span class="misc" title="Miscellaneous information">{include 'data/subfield.tpl' value=$field->subfields->g}</span>
      {/if}
      {* 111j_MainMeetingName_relatorTerm_ss *}
      {if isset($field->subfields->h)}
        <span class="medium" title="Medium">{include 'data/subfield.tpl' value=$field->subfields->h}</span>
      {/if}
      {* 130k_MainUniformTitle_formSubheading_ss *}
      {if isset($field->subfields->k)}
        <span class="form" title="Form subheading">{include 'data/subfield.tpl' value=$field->subfields->k}</span>
      {/if}
      {if isset($field->subfields->l)}
        <span class="form" title="Language of a work">{include 'data/subfield.tpl' value=$field->subfields->l}</span>
      {/if}
      {* 130m_MainUniformTitle_mediumOfPerformance_ss *}
      {if isset($field->subfields->m)}
        <span class="medium" title="Medium of performance for music">{include 'data/subfield.tpl' value=$field->subfields->m}</span>
      {/if}
      {* 130n_MainUniformTitle_numberOfPart_ss *}
      {if isset($field->subfields->n)}
        <span class="part" title="Number of part/section of a work">{include 'data/subfield.tpl' value=$field->subfields->n}</span>
      {/if}
      {* 130o_MainUniformTitle_arrangedStatement_ss *}
      {if isset($field->subfields->o)}
        <span class="statement" title="Arranged statement for music">{include 'data/subfield.tpl' value=$field->subfields->o}</span>
      {/if}
      {* 130p_MainUniformTitle_nameOfPart_ss *}
      {if isset($field->subfields->p)}
        <span class="part-name" title="Name of part/section of a work">{include 'data/subfield.tpl' value=$field->subfields->p}</span>
      {/if}
      {* 130r_MainUniformTitle_keyForMusic_ss *}
      {if isset($field->subfields->r)}
        <span class="key" title="Key for music">{include 'data/subfield.tpl' value=$field->subfields->r}</span>
      {/if}
      {* 130s_MainUniformTitle_version_ss *}
      {if isset($field->subfields->s)}
        <span class="version" title="Version">{include 'data/subfield.tpl' value=$field->subfields->s}</span>
      {/if}
      {if isset($field->subfields->t)}
        <span class="version" title="Title of a work">{include 'data/subfield.tpl' value=$field->subfields->t}</span>
      {/if}
      {* 1300_MainUniformTitle_authorityRecordControlNumber_ss *}
      {if property_exists($field->subfields, '0')}
        [<a href="{$record->filter('1300_MainUniformTitle_authorityRecordControlNumber_ss', $field->subfields->{'0'})}" class="record-link">
        <span class="version" title="Authority record control number or standard number">{include 'data/subfield.tpl' value=$field->subfields->{'0'}}</span></a>]
      {/if}
    </span>
    <br/>
  {/foreach}
  </td>
</tr>
{/if}
