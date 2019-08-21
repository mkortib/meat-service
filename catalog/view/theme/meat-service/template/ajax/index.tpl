<!-- catalog/view/theme/default/template/ajax/index.tpl -->
<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h2><?php echo $heading_title; ?></h2>
            <fieldset id="account">
                <div>
                    <label class="col-sm-2 control-label" for="product"><?php echo $text_product_dropdown_label; ?></label>
                    <div class="col-sm-10">
                        <select name="product" class="form-control" id="product">
                            <option>-- <?php echo $text_product_dropdown_label; ?> --</option>
                            <?php foreach ($products as $product) { ?>
                            <option value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </fieldset>
            <div id="product_summary"></div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    $('#product').on('change', function() {
        $.ajax({
            url: 'index.php?route=ajax/index/ajaxGetProduct&product_id=' + this.value,
            dataType: 'html',
            success: function(htmlText) {
                $('#product_summary').html(htmlText);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
</script>