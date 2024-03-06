{include 'common/html-head.tpl'}
<div class="container">
    {include 'common/header.tpl'}
    {include 'common/nav-tabs.tpl'}
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="shelf-ready-completeness" role="tabpanel" aria-labelledby="shelf-ready-completeness-tab">
      <h2>Shelf-Ready completeness</h2>
      <p>These scores are the implementation of the following paper:</p>

      <blockquote>
        Emma Booth (2020)
        <em>Quality of Shelf-Ready Metadata. Analysis of survey responses and
          recommendations for suppliers</em>, Pontefract (UK): National Acquisitions Group, 2020. p 31.
        <a href="https://nag.org.uk/wp-content/uploads/2020/06/NAG-Quality-of-Shelf-Ready-Metadata-Survey-Analysis-and-Recommendations_FINAL_June2020.pdf"
           target="_blank">https://nag.org.uk/wp-content/uploads/2020/06/NAG-Quality-of-Shelf-Ready-Metadata-Survey-Analysis-and-Recommendations_FINAL_June2020.pdf</a>
      </blockquote>
      <p>
        The main purpose of the report is to highlight which fields of the printed and electronic
        book records are important when the records are coming from different suppliers. 50 libraries
        participated in the survey, each selected which fields are important to them. The report
        listed those fields which gets the highest scores.<br/>
        The current calculation based on this list of essentian fields. If all data elements
        specified are available in the record it gets the full scrore, if only some of them,
        it gets a proportional score. E.g. under 250 (edition statement) there are two subfields.
        If both are available, it gets score 44. If only one of them, it gets the half of it, 22,
        and if none, it gets 0. For 1XX,, 6XX, 7XX and 8XX the record gets the full scores if at
        least one of those fields (with subfield $a) is available. The total score became the average.
        The theoretical maximum score would be 28.44, which could be accessed if all the
        data elements are available in the record.
      </p>
      <div id="shelf-ready-completeness-content">
        {include 'shelf-ready-completeness/shelf-ready-completeness-histogram.tpl'}
      </div>
    </div>
  </div>
  {include 'common/parameters.tpl'}
</div>
{include 'common/html-footer.tpl'}