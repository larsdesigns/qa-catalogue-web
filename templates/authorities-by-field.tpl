<h3>Authority schemes</h3>

<table id="authorities-by-field">
  <thead>
    <tr>
      <th class="location">Location</th>
      <th class="scheme">Classification/subject headings scheme</th>
      <th class="instances">Instances</th>
      <th class="records">Records</th>
      <th class="chart">chart</th>
      <th class="chart">%</th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$fieldHierarchy key=name item=category}
      <tr class="category">
        <td colspan="2"><h4><i class="fa {$category->icon}" aria-hidden="true" title="{$name}" style="color: black"></i> {$name}</h4></td>
        <td title"instances" class="text-right">{$category->instancecount|number_format}</td>
        <td title"records" class="text-right">{$category->recordcount|number_format}</td>
        <td class="chart"><div style="width: {ceil($category->ratio * 200)}px;">&nbsp;</div></td>
        <td class="text-right" title="{$category->percent|number_format:8}%">{$category->percent|number_format:2}%</td>
      </tr>
      {foreach from=$category->fields key=field item=fieldName}
        {if count($recordsByField[$field]) > 0}
          <tr>
            <td colspan="6"><h5>{$field} &mdash; {$fieldName}</h5></td>
          </tr>
          {foreach from=$recordsByField[$field] item=record}
            <tr>
              <td>{$record->location}</td>
              <td>
                {if (isset($record->facet2))}
                  {if $record->facet2exists}
                    <a href="?tab=terms&facet={$record->facet2}&query="*:*&scheme=%22{$record->scheme|urlencode}%22" class="term-link facet2">{$record->scheme}</a>
                  {else}
                    {$record->scheme}
                  {/if}
                {elseif (isset($record->facet) && isset($record->q))}
                  <a href="?tab=terms&facet={$record->facet}&query={$record->q}&scheme=%22{$record->scheme|urlencode}%22">{$record->scheme}</a>
                {else}
                  {if $record->scheme == 'undetectable'}not specified{else}{$record->scheme}{/if}
                {/if}
                <i class="fa fa-chevron-down"  data-id="authority-subfields-{$record->id}" aria-hidden="true" title="show subfields"></i>
                {if $hasSubfields && isset($record->id) && isset($subfields[$record->id])}
                  <div id="authority-subfields-{$record->id}" class="authority-subfields">
                    <p>Which subfields are available in the individual instances of this field?</p>
                    <table class="matrix">
                      {foreach from=$matrices[$record->id]['codes'] key=code item=divs}
                        {assign var="total" value=0}
                        {assign var="key" value="{$record->field}{$code}"}
                        {assign var=MAX_WIDTH value=280 - count($divs)}
                        <tr>
                          <td class="labels">
                            <a href="?tab=completeness#completeness-{$key}" class="completeness" data-field="{$key}">{$code}</a>
                            {if isset($elements[$key]) && $elements[$key] != ''}
                              {$elements[$key]}
                            {elseif $item == '$9'}
                              &mdash; <span>(locally defined subfield)</span>
                            {else}
                              &mdash; <span>(not defined in MARC21)</span>
                            {/if}
                          </td>
                          <td class="bars">
                            {foreach from=$divs item=div name=divs}
                              {assign var=width value=ceil($matrices[$record->id]['widths'][$smarty.foreach.divs.index]['perc'] * $MAX_WIDTH)}
                              {assign var=color value=($div > 0) ? 'green' : 'white'}
                              <span style="width: {$width}px" class="{$color}">&nbsp;</span>
                              {$total = $total + $div}
                            {/foreach}
                          </td>
                          <td class="total">{$total|number_format}</td>
                          </tr>
                        {/foreach}
                    </table>
                    <table>
                      <thead>
                        <tr>
                          <th>subfields</th>
                          <th class="count">count</th>
                        </tr>
                      </thead>
                      <tbody>
                        {foreach from=$subfields[$record->id]['list'] item=item}
                          <tr>
                            <td>
                              {foreach from=$item->subfields item=subfield}
                                {assign var="sub" value={substr($subfield, 0, 2)}}
                                <a href="?tab=completeness#completeness-{$record->field}{$sub}" class="completeness" data-field="{$record->field}{$sub}"
                                  >{$subfield}</a>{if !$subfield@last}, {/if}
                              {/foreach}
                            </td>
                            <td class="count">{$item->count|number_format}</td>
                          </tr>
                        {/foreach}
                      </tbody>
                    </table>
                    {if $subfields[$record->id]['has-plus'] || $subfields[$record->id]['has-space']}
                      <p>notes:</p>
                      <ul>
                        {if $subfields[$record->id]['has-plus']}
                          <li>+ sign denotes multiple instances</li>
                        {/if}
                        {if $subfields[$record->id]['has-space']}
                          <li>_ sign denotes space character</li>
                        {/if}
                      </ul>
                    {/if}
                  </div>
                {/if}
              </td>
              <td title"instances" class="text-right">{$record->instancecount|number_format}</td>
              <td title"records" class="text-right">{$record->recordcount|number_format}</td>
              <td class="chart"><div style="width: {ceil($record->ratio * 200)}px;">&nbsp;</div></td>
              <td class="text-right" title="{$record->percent|number_format:8}%">{$record->percent|number_format:2}%</td>
            </tr>
          {/foreach}
        {/if}
      {/foreach}
    {/foreach}
  </tbody>
</table>


<script>
// $()
$('table#authorities-by-field i').click(function (event) {
  event.preventDefault();
  var id = '#' + $(this).attr('data-id');
  $(id).toggle();
  var up = 'fa-chevron-up';
  var down = 'fa-chevron-down';
  if ($(this).hasClass(down)) {
    $(this).removeClass(down);
    $(this).addClass(up);
  } else {
    $(this).removeClass(up);
    $(this).addClass(down);
  }
});
$('a.completeness').click(function () {
  showTab('completeness');
  setCompletenessLinkHandlers();
});
</script>