<?php
  $imgArr = [
    '/image/catalog/category/freezz.svg',
    '/image/catalog/category/cold.svg',
    '/image/catalog/category/butcher.svg'
  ];
  $counter = 0;
?>

<div class="panel panel-default panel_filter_custom">
  <!--*<div class="panel-heading"><?php echo $heading_title; ?>Фільтри</div>*-->
  <div class="list-group list-group_filter">
    <?php foreach ($filter_groups as $filter_group) { ?>
    <a class="list-group-item caption"><?php // echo $filter_group['name']; ?>
        <img src="/image/catalog/category/filter.svg" alt="filter">
        Фільтри
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0581 10.4419L12.942 9.55801L7.50006 4.11609L2.05811 9.55801L2.94199 10.4419L7.50006 5.88384L12.0581 10.4419Z" fill="#2B2F31" fill-opacity="0.75"/>
        </svg>
    </a>
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
        <?php foreach ($filter_group['filter'] as $filter) { ?>
        <div class="checkbox">
          <label>
            <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
              <img src="<?php echo $imgArr[$counter]; $counter++ ?>" alt="">
            <span class="filter_caption"><?php echo $filter['name']; ?></span>
              <label class="container_checkbox">
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                  <span class="checkmark"></span>
              </label>
            <?php } else { ?>
              <img src="<?php echo $imgArr[$counter]; $counter++ ?>" alt="">
              <span class="filter_caption"><?php echo $filter['name']; ?></span>
              <label class="container_checkbox">
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
                  <span class="checkmark"></span>
              </label>
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer panel_footer_custom text-right">
    <button type="button" id="button-filter" class="btn btn-primary"><?php // echo $button_filter; ?>Пошук</button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script>
