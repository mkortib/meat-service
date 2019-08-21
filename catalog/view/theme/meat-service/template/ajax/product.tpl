<!-- catalog/view/theme/default/template/ajax/product.tpl -->
<div style="border: 1px solid #CCC;padding:10px;margin:10px;">
    <h3><?php echo $product['name']; ?> - <?php echo $price; ?></h3>
    <p><img src="<?php echo $thumb; ?>"/></p>
    <p><b><?php echo $text_manufacturer; ?></b>&nbsp;<?php echo $product['manufacturer']; ?></p>
    <p><b><?php echo $text_model; ?></b>&nbsp;<?php echo $product['model']; ?></p>
</div>