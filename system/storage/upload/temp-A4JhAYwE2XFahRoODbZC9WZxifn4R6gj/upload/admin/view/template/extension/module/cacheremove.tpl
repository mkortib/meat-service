<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $text_cacheremove; ?></h1>
      <ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
      </ul>
    </div>
  </div>
	<div class="container-fluid">
		<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-paint-brush"></i> <?= $heading_title ?></h3>
      </div>
      <div class="panel-body">
				<style>
					.alert .fa {
						width: 15px;
						font-size: 125%;
						display: inline-block;
					}
				</style>
				<div class="alert">&nbsp;</div>
				<form id="form1" action="<?php echo $action; ?>" method="post">
					<table class="form">
						<tbody>
							<tr>
								<td><?= $text_data ?> &nbsp;&nbsp;</td>
								<td><button class='delete_cache btn btn-default' data-path="<?php echo $cache_data; ?>"><i class="fa fa-paint-brush"></i> <?= $btn_clear ?></button></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><?= $text_image ?> &nbsp;&nbsp;</td>
								<td><button class='delete_cache btn btn-default' data-path="<?php echo $cache_image; ?>">
										<i class="fa fa-paint-brush"></i> <?= $btn_clear ?></button></td>
							</tr>
					</tbody>
				</table>
			</form>
			</div>
		</div>
		<div class="copywrite" style="padding: 10px 10px 0 10px; border: 1px dashed #ccc;">
    	<p>
    		&copy; <?=$text_author?>: <a href="http://sergetkach.com/link/272" target="_blank">Serge Tkach</a>
    		<br/>
				<?=$text_author_support?>: <a href="mailto:sergheitkach@gmail.com">sergheitkach@gmail.com</a>
    	</p>
    </div>
	</div>
</div>


<script>
	$('.delete_cache').on('click', function (e) {
		e.preventDefault();
		var path = $(this).attr('data-path');

		$('.alert').removeClass('alert-success alert-danger');
		$('.alert').html('&nbsp;');

		$.ajax({
			url: 'index.php?route=extension/module/cacheremove/delete&token=<?php echo $token; ?>',
			dataType: 'json',
			type: "POST",
			data: {'path': path},
			success: function (json) {
				$(".alert").html(json.answer);
				$(".alert").addClass(json.type);
			}
		});
	});
</script>
<?php echo $footer; ?>