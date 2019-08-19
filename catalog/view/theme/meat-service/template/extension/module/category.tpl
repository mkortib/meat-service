<?php
  $imgArr = [
    '/image/catalog/category/turkey.svg',
    '/image/catalog/category/chicken.svg',
    '/image/catalog/category/pig.svg'
  ];
  $counter = 0;
?>


<div class="list-group list-group_custom">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
  <div class="category_head">Категорії товарів</div>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">
    <img src="<?php echo $imgArr[$counter]; $counter++?>" alt="">
    <?php $pos = strpos($child['name'], '('); echo substr($child['name'], 0, $pos)?>
    <img class="arrow_cat" src="/image/catalog/category/chevron.svg" alt="arrow">
  </a>
    <ul class="sub_cat">
      <?php foreach($products as $product) { ?>
        <li>
          <a href="<?php echo $product['href'] ?>"><?php $pos = strpos($product['name'], '('); echo substr($product['name'], $pos) ?></a>
        </li>
      <?php } ?>
    </ul>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item">
    <img src="<?php echo $imgArr[$counter]; $counter++?>" alt="">
    <?php $pos = strpos($child['name'], '('); echo substr($child['name'], 0, $pos)?>
    <img class="arrow_cat" src="/image/catalog/category/chevron.svg" alt="arrow">
  </a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php $pos = strpos($child['name'], '('); echo substr($child['name'], 0, $pos)?></a>
  <?php } ?>
  <?php } ?>
</div>
