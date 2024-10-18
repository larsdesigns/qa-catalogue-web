{assign var="fieldInstances" value=$record->getFields('611')}
{if !is_null($fieldInstances)}
<tr>
  <td><em>meetings</em>:</td>
  <td>
    {foreach from=$fieldInstances item=field}
      <span class="611">
          {* Personal name *}
          {if isset($field->subfields->a)}
            <i class="fa fa-hashtag" aria-hidden="true" title="meeting name"></i>
            <a href="{$record->filter('611a_SubjectAddedMeetingName_ss', $field->subfields->a)}" class="record-link">{include 'data/subfield.tpl' value=$field->subfields->a}</a>
          {/if}

          {if isset($field->subfields->b)}
            <span class="numeration" data="611b_SubjectAddedMeetingName_b_ss">{include 'data/subfield.tpl' value=$field->subfields->b}</span>
          {/if}

          {if isset($field->subfields->c)}
            <span class="location" data="611c_SubjectAddedMeetingName_locationOfMeeting_ss">{include 'data/subfield.tpl' value=$field->subfields->c}</span>
          {/if}

          {if isset($field->subfields->d)}
            <span class="dates" data="611d_SubjectAddedMeetingName_dates_ss">{include 'data/subfield.tpl' value=$field->subfields->d}</span>
          {/if}

          {if property_exists($field->subfields, '2')}
            vocabulary: {include 'data/subfield.tpl' value=$field->subfields->{'2'}}</a>
          {/if}

          {* 6500_Topic_authorityRecordControlNumber_ss *}
          {if property_exists($field->subfields, '0')}
            (authority: <a href="{$record->filter('6110', $field->subfields->{'0'})}" class="record-link">{include 'data/subfield.tpl' value=$field->subfields->{'0'}}</a>)
          {/if}
        </span>
      <br/>
    {/foreach}
  </td>
</tr>
{/if}
