<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if ($breadcrumb == end($breadcrumbs)) : ?>
        <li class="active_breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php else : ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php endif ?>
    <?php } ?>
  </ul>
  <div class="row cat_row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> catalog_row"><?php echo $content_top; ?>

      <?php if ($products) { ?>
      <div class="row">
        <!--*<div class="col-md-2 col-sm-6 hidden-xs">*-->
          <!--*<div class="btn-group btn-group-sm">*-->
            <!--*<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>*-->
            <!--*<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>*-->
          <!--*</div>*-->
        <!--*</div>*-->
        <!--*<div class="col-md-3 col-sm-6">*-->
          <!--*<div class="form-group">*-->
            <!--*<a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>*-->
          <!--*</div>*-->
        <!--*</div>*-->
        <div class="col-md-6 col-sm-6">
          <h2 class="catalog_items_title">Наша продукція</h2>
        </div>
        <div class="col-md-6 col-xs-6">
          <div class="show_count">
            <p class="show_text"><?php echo $text_limit; ?></p>
            <select id="input-limit" class="checkbox_show" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <div class="row products_row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              </div>
              <button type="button" class="to_wish" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row d_none">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="load_more">Більше продукції</div>
        </div>
      </div>
      <?php } ?>
      <!--* row custom info *-->

      <div class="row">

        <div class="col-md-4">
          <div class="catalog_item_wr">
            <div class="item_bl">
              <img src="/image/catalog/category/delivery-truck.svg" alt="">
              <p>Вирощені на якісних натуральних, зернових кормах власного виробництва</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="catalog_item_wr">
            <div class="item_bl">
              <img src="/image/catalog/category/ecology.svg" alt="">
              <p>Вирощені на якісних натуральних, зернових кормах власного виробництва</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="catalog_item_wr">
            <div class="item_bl">
              <img src="/image/catalog/category/love.svg" alt="">
              <p>Вирощені на якісних натуральних, зернових кормах власного виробництва</p>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="seo_catalog_txt">
            <p><strong>Повний фарш - м’ясний сервіс </strong> – первый в Украине производитель и поставщик мраморного мяса. Компания основана в мае 2015 года и начинала свою деятельность с пятью сотрудниками на 20 м². В июне того же года был открыт фирменный магазин мяса на Столичном рынке, запущен информационный сайт и заработал интернет-магазин. Сегодня компания T-Bone вошла в стадию активного роста и развития. У нас есть собственные производственные площади, и мы не планируем останавливаться на достигнутом.</p>
            <p>Наша компания тесно сотрудничает с фермерскими хозяйствами Украины. Отбирая лучших представителей мясных пород, мы гарантируем абсолютное качество готового продукта.</p>
            <p>В процессе изготовления мраморной говядины применяются современные наработки в области ферментации. Мы постоянно экспериментируем, внедряя новые технологии и способы улучшения органолептических свойств исходного продукта.</p>
            <p>Мы работаем только со свежим мясом «из-под ножа». Каждый стейк нарезается и зачищается индивидуально сразу же после оформления заказа с учетом пожеланий клиента. Мы никогда не замораживаем мясо и работаем только с охлажденным продуктом. Именно в таком виде стейки попадает на ваш стол.</p>
            <p>Купить мраморное мясо ТМ T-Bone можно в фирменных розничных магазинах, магазинах торговых сетей, интернет магазинах фермерских и органических продуктов. Наш интернет магазин принимает заказы круглосуточно, отправляя мясную продукцию в любую точку Украины. Мы постоянно работаем над тем, чтобы каждый мог купить качественное мясо, формируя новые, нетрадиционные каналы сбыта.</p>
          </div>
        </div>
      </div>


      <!--*  *-->
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
