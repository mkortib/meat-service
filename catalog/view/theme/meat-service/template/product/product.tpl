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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>

          <!--**-->

          <div class="slider_product_block">
            <div class="slider_full">
              <div class="slider-for">
                <?php if ($thumb) { ?>
                  <div>
                    <a class="thumbnail product_slider_img"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                    <a class="full_img" data-fancybox="gallery" href="<?php echo $popup; ?>">
                      <img src="/image/catalog/category/maximize.svg" alt="max">
                    </a>
                  </div>
                <?php } ?>
                <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                    <div>
                      <a class="thumbnail product_slider_img"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
                      <a class="full_img" data-fancybox="gallery" href="<?php echo $popup; ?>">
                        <img src="/image/catalog/category/maximize.svg" alt="max">
                      </a>
                    </div>
                  <?php } ?>
                <?php } ?>
              </div>
              <button type="button" data-toggle="tooltip" class="btn btn-default to_wish" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o"></i></button>
              <div class="slider_product_nav">
                <div class="arrow left_arrow">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0581 10.4419L12.942 9.55801L7.50006 4.11609L2.05811 9.55801L2.94199 10.4419L7.50006 5.88384L12.0581 10.4419Z" fill="#2B2F31" fill-opacity="0.75"/>
                  </svg>
                </div>
                <div class="arrow right_arrow">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0581 10.4419L12.942 9.55801L7.50006 4.11609L2.05811 9.55801L2.94199 10.4419L7.50006 5.88384L12.0581 10.4419Z" fill="#2B2F31" fill-opacity="0.75"/>
                  </svg>
                </div>
              </div>
            </div>

            <div class="slider-nav">
              <?php if ($thumb) { ?>
              <div><a class="thumbnail product_slider_img_nav"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
              <?php } ?>
              <?php if ($images) { ?>
              <?php foreach ($images as $image) { ?>
              <div><a class="thumbnail product_slider_img_nav"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>

          <!--**-->
          <?php } ?>

        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> main_prod_info">
          <!--* prod main info *-->
          <h1><?php echo $heading_title; ?></h1>
          <div id="product">

            <div class="product_main_options">

              <?php if ($attribute_groups) { ?>

                  <?php foreach ($attribute_groups as $attribute_group) { ?>

                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>

                      <div class="product_option">
                        <div class="option_title"><?php echo $attribute['name']; ?></div>
                        <div class="option_value"><?php echo $attribute['text']; ?></div>
                      </div>

                    <?php } ?>

                  <?php } ?>

              <?php } ?>

            </div>

            <?php if ($options) { ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="button button_product_cart with_svg">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M4 8.99997H5.99978C6.00007 9.36652 6.20262 9.71932 6.55279 9.8944C7.04676 10.1414 7.64744 9.94117 7.89443 9.44719L8.11803 8.99997H15.882L16.1056 9.44719C16.3526 9.94117 16.9532 10.1414 17.4472 9.8944C17.7974 9.71932 17.9999 9.36652 18.0002 8.99997H20V11H4V8.99997ZM17.118 6.99997H20C21.1046 6.99997 22 7.89541 22 8.99997V11C22 11.84 21.4821 12.5591 20.7482 12.8553C20.7516 12.9031 20.7534 12.9513 20.7534 13C20.7534 13.1459 20.7374 13.2914 20.7058 13.4338L19.1502 20.4338C18.9469 21.3489 18.1352 22 17.1978 22H6.80217C5.86477 22 5.05315 21.3489 4.8498 20.4338L3.29424 13.4338C3.25095 13.239 3.23767 13.0445 3.25134 12.8551C2.51767 12.5588 2 11.8398 2 11V8.99997C2 7.89541 2.89543 6.99997 4 6.99997H6.88197L9.10557 2.55276C9.35256 2.05878 9.95323 1.85856 10.4472 2.10555C10.9412 2.35254 11.1414 2.95321 10.8944 3.44719L9.11803 6.99997H14.882L13.1056 3.44719C12.8586 2.95321 13.0588 2.35254 13.5528 2.10555C14.0468 1.85856 14.6474 2.05878 14.8944 2.55276L17.118 6.99997ZM5.24662 13H18.7534L17.1978 20H6.80217L5.24662 13Z" fill="#2B2F31"/>
                </svg>
                Додати у кошик
              </button>
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <a class="dowland_pdf">
            <img src="/image/catalog/icons/download.svg" alt="завантажити pdf">
            Завантажити PDF презентацію
          </a>
        </div>
      </div>
      <!--* manufacturer, sertificate, delivery *-->
      <div class="row middle_cnt">
        <div class="col-md-4">
          <div class="middle_item">
            <div class="top_cnt">
              <svg width="75" height="75" viewBox="0 0 75 75" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M68.6231 18.4114C65.2031 15.6857 60.376 13.4542 54.2758 11.779C42.5438 8.55723 29.3137 8.20947 24.1701 8.20947C10.8426 8.20947 0 19.0522 0 32.3797V42.6204C0 55.948 10.8426 66.7906 24.1701 66.7906C30.3155 66.7906 34.9308 64.8655 39.8171 62.8273C44.8702 60.7196 50.0952 58.5402 57.4437 58.5402C67.1243 58.5402 75 50.6643 75 40.9839V30.7432C75 25.9328 72.8544 21.7837 68.6231 18.4114ZM67.3895 43.4535C67.9441 44.0428 68.8712 44.0705 69.4603 43.516C70.4537 42.5806 71.3276 41.5383 72.0703 40.4161V40.9839C72.0703 49.0492 65.5088 55.6105 57.4437 55.6105C49.5086 55.6105 44.0084 57.9047 38.6893 60.1234C34.0813 62.0454 29.729 63.8609 24.1701 63.8609C12.9171 63.8609 3.68145 55.0641 2.9748 43.9862C7.08809 51.4676 15.0464 56.5496 24.1701 56.5496C30.3155 56.5496 34.9308 54.6245 39.8171 52.5863C44.8702 50.4786 50.0952 48.2992 57.4437 48.2992C57.9896 48.2992 58.5412 48.2734 59.0832 48.2227C59.8887 48.1473 60.4805 47.4332 60.405 46.6276C60.3296 45.8223 59.6146 45.2306 58.81 45.3059C58.3584 45.3481 57.8988 45.3696 57.4437 45.3696C49.5086 45.3696 44.0084 47.6639 38.6893 49.8825C34.0813 51.8045 29.729 53.6201 24.1701 53.6201C12.4581 53.6201 2.92969 44.0917 2.92969 32.3798C2.92969 20.6678 12.4581 11.1393 24.1701 11.1393C29.1949 11.1393 42.1116 11.477 53.5 14.6042C65.8223 17.9882 72.0703 23.4181 72.0703 30.7432C72.0703 34.7415 70.3869 38.6195 67.452 41.3828C66.8629 41.9374 66.835 42.8645 67.3895 43.4535Z" fill="#2B2F31"/>
                <path d="M66.1851 44.3883C65.8405 43.6564 64.9676 43.3421 64.2359 43.6867C64.2254 43.6915 64.2115 43.6984 64.2011 43.7035C63.4776 44.0653 63.1843 44.9453 63.546 45.6688C63.8026 46.182 64.32 46.4788 64.8575 46.4788C65.0746 46.4788 65.2949 46.4303 65.5026 46.3282C66.2208 45.9777 66.5265 45.1139 66.1851 44.3883Z" fill="#2B2F31"/>
                <path d="M34.7443 14.4819L34.6689 14.4757C33.8612 14.4127 33.1564 15.013 33.0921 15.8196C33.0278 16.626 33.6294 17.3319 34.4358 17.3963L34.5107 17.4022C34.5504 17.4054 34.5898 17.407 34.629 17.407C35.385 17.407 36.0262 16.8255 36.0877 16.0589C36.1522 15.2524 35.5507 14.5465 34.7443 14.4819Z" fill="#2B2F31"/>
                <path d="M68.2258 26.7968C66.7728 23.9251 63.5399 21.4434 58.6166 19.4207C54.6329 17.784 50.2763 16.7501 47.323 16.1708C45.5531 15.8238 43.6983 15.5138 41.8101 15.2499C41.0093 15.1368 40.2687 15.6963 40.1564 16.4978C40.0444 17.299 40.6031 18.0392 41.4043 18.1513C43.2398 18.4079 45.0414 18.7089 46.7592 19.0459C56.8212 21.0191 63.6927 24.3263 65.6116 28.1191C66.0147 28.9161 66.2107 29.7744 66.2107 30.7429C66.2107 35.5771 62.2778 39.51 57.4435 39.51C52.5556 39.51 47.8091 40.3088 42.9326 41.9522C40.8323 42.6602 38.793 43.5064 36.8209 44.325C35.5164 44.8662 34.1676 45.4261 32.8287 45.9334C29.45 47.2139 26.8604 47.7603 24.1699 47.7603C15.6887 47.7603 8.78872 40.8605 8.78872 32.3794C8.78872 23.8983 15.6887 16.9983 24.1699 16.9983C25.8244 16.9983 27.5041 17.0296 29.1621 17.0915C29.4435 17.1019 29.7251 17.1131 30.007 17.1256C30.8146 17.1622 31.4994 16.535 31.535 15.7267C31.5707 14.9185 30.9443 14.2343 30.1362 14.1987C29.8476 14.1859 29.559 14.1744 29.271 14.1637C27.577 14.1005 25.8606 14.0686 24.1697 14.0686C14.0731 14.0686 5.85889 22.2827 5.85889 32.3794C5.85889 42.4759 14.073 50.69 24.1697 50.69C27.2364 50.69 30.1365 50.0868 33.8668 48.6729C35.2483 48.1494 36.6186 47.5807 37.9438 47.0307C39.8705 46.2312 41.8628 45.4043 43.8682 44.7284C48.4382 43.1882 52.8788 42.4396 57.4435 42.4396C63.8932 42.4398 69.1404 37.1926 69.1404 30.7431C69.1404 29.3043 68.8412 28.0135 68.2258 26.7968Z" fill="#2B2F31"/>
                <path d="M25.5729 19.8955C21.4778 19.8955 18.146 22.9167 18.146 26.6304C18.146 30.3441 21.4778 33.3653 25.5729 33.3653C29.6682 33.3653 32.9998 30.3441 32.9998 26.6304C32.9998 22.9167 29.6682 19.8955 25.5729 19.8955ZM25.5729 30.4355C23.0931 30.4355 21.0757 28.7285 21.0757 26.6303C21.0757 24.5322 23.0931 22.825 25.5729 22.825C28.0527 22.825 30.0701 24.532 30.0701 26.6303C30.0701 28.7285 28.0527 30.4355 25.5729 30.4355Z" fill="#2B2F31"/>
              </svg>
              Виробник:
            </div>
            <p>ТОВ “Агро-Рось”, ТМ “Повний Фарш - М’ясний сервіс”</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="middle_item">
            <div class="top_cnt">
              <svg width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M39.375 8.17383C39.8604 8.17383 40.2539 7.78034 40.2539 7.29492V2.63672C40.2539 1.18283 39.0711 0 37.6172 0H2.63672C1.18283 0 0 1.18283 0 2.63672V42.3633C0 43.8172 1.18283 45 2.63672 45H37.6172C39.0711 45 40.2539 43.8172 40.2539 42.3633V39.9023C40.2539 39.4169 39.8604 39.0234 39.375 39.0234C38.8896 39.0234 38.4961 39.4169 38.4961 39.9023V42.3633C38.4961 42.8479 38.1018 43.2422 37.6172 43.2422H2.63672C2.15209 43.2422 1.75781 42.8479 1.75781 42.3633V2.63672C1.75781 2.15209 2.15209 1.75781 2.63672 1.75781H37.6172C38.1018 1.75781 38.4961 2.15209 38.4961 2.63672V7.29492C38.4961 7.78034 38.8896 8.17383 39.375 8.17383Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M35.1563 4.21875H5.09668C4.61126 4.21875 4.21777 4.61224 4.21777 5.09766V23.4668C4.21777 23.9522 4.61126 24.3457 5.09668 24.3457C5.5821 24.3457 5.97559 23.9522 5.97559 23.4668V5.97656H34.2774V7.38281C34.2774 7.86823 34.671 8.26172 35.1563 8.26172C35.6418 8.26172 36.0352 7.86823 36.0352 7.38281V5.09766C36.0352 4.61224 35.6418 4.21875 35.1563 4.21875Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M5.71807 26.0974C5.55459 25.9339 5.32871 25.8398 5.09668 25.8398C4.86553 25.8398 4.63877 25.9339 4.47529 26.0974C4.31182 26.2608 4.21777 26.4876 4.21777 26.7188C4.21777 26.9499 4.31182 27.1767 4.47529 27.3401C4.63877 27.5036 4.86553 27.5977 5.09668 27.5977C5.32871 27.5977 5.55459 27.5036 5.71807 27.3401C5.88242 27.1767 5.97559 26.9499 5.97559 26.7188C5.97559 26.4876 5.88242 26.2608 5.71807 26.0974Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M35.1563 37.0898C34.6709 37.0898 34.2774 37.4833 34.2774 37.9688V39.0234H5.97559V30.1025C5.97559 29.6171 5.5821 29.2236 5.09668 29.2236C4.61126 29.2236 4.21777 29.6171 4.21777 30.1025V39.9023C4.21777 40.3878 4.61126 40.7812 5.09668 40.7812H35.1563C35.6418 40.7812 36.0352 40.3878 36.0352 39.9023V37.9688C36.0352 37.4833 35.6418 37.0898 35.1563 37.0898Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M27.2385 31.0549C26.8953 30.7115 26.3388 30.7115 25.9955 31.0548L24.2585 32.7919L23.1787 31.7121C22.497 31.0304 21.3879 31.0304 20.7061 31.7121L20.0035 32.4147C19.6603 32.7579 19.6603 33.3144 20.0035 33.6577C20.3467 34.0009 20.9032 34.0009 21.2465 33.6577L21.9425 32.9618L23.0222 34.0416C23.363 34.3825 23.8108 34.5529 24.2585 34.5529C24.7062 34.5529 25.1539 34.3825 25.4947 34.0416L27.2385 32.2979C27.5817 31.9547 27.5817 31.3982 27.2385 31.0549Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M44.5957 18.4379C44.983 17.8337 45.0987 17.0894 44.9129 16.3961C44.7271 15.7028 44.2549 15.1162 43.6173 14.7866C43.3408 14.6437 43.1715 14.3505 43.186 14.0396C43.2193 13.3226 42.9474 12.6203 42.4399 12.1128C41.9324 11.6053 41.2304 11.3329 40.5131 11.3667C40.2007 11.3818 39.909 11.2118 39.7661 10.9354C39.4365 10.2978 38.8498 9.8256 38.1566 9.6398C37.463 9.45391 36.719 9.56966 36.1149 9.95699C35.8529 10.125 35.5143 10.125 35.2524 9.95699C34.6481 9.56957 33.9041 9.45399 33.2107 9.6398C32.5174 9.8256 31.9307 10.2978 31.6011 10.9354C31.4582 11.2119 31.1642 11.3807 30.8542 11.3667C30.1369 11.3332 29.4349 11.6053 28.9274 12.1128C28.4199 12.6203 28.1479 13.3226 28.1812 14.0395C28.1957 14.3505 28.0264 14.6437 27.75 14.7866C27.1124 15.1162 26.6402 15.7028 26.4544 16.3961C26.3657 16.7269 26.3464 17.0692 26.3919 17.4024H11.055C10.5695 17.4024 10.176 17.7959 10.176 18.2813C10.176 18.7667 10.5695 19.1602 11.055 19.1602H26.8409C26.822 19.2084 26.8001 19.2558 26.7715 19.3005C26.3841 19.9047 26.2685 20.649 26.4543 21.3423C26.4798 21.4374 26.5111 21.5304 26.5472 21.6211H11.0547C10.5693 21.6211 10.1758 22.0146 10.1758 22.5C10.1758 22.9855 10.5693 23.3789 11.0547 23.3789H28.1288C28.167 23.4794 28.1862 23.5878 28.181 23.6988C28.1477 24.4158 28.4196 25.118 28.9272 25.6256C29.4346 26.1331 30.1366 26.4056 30.8539 26.3717C31.1644 26.3565 31.458 26.5265 31.6009 26.803C31.7064 27.0072 31.8387 27.1942 31.9921 27.3606V35.5689C31.9921 35.924 32.2057 36.2442 32.5336 36.3805C32.8613 36.5168 33.2391 36.4425 33.4909 36.192L35.6835 34.0108L37.8761 36.192C38.0441 36.3592 38.2682 36.4478 38.4962 36.4478C38.6097 36.4478 38.7243 36.4258 38.8334 36.3804C39.1612 36.2441 39.3749 35.9239 39.3749 35.5689V27.3605C39.5283 27.1942 39.6605 27.0072 39.7661 26.8029C39.909 26.5264 40.2026 26.3575 40.5131 26.3716C41.2308 26.4055 41.9323 26.1331 42.4398 25.6255C42.9474 25.118 43.2193 24.4157 43.186 23.6987C43.1715 23.3878 43.3409 23.0946 43.6173 22.9517C44.2548 22.6221 44.7271 22.0355 44.9129 21.3422C45.0987 20.6488 44.983 19.9046 44.5957 19.3003C44.4276 19.0385 44.4276 18.6999 44.5957 18.4379ZM37.6171 33.4549L36.3033 32.148C35.9604 31.8069 35.4065 31.8069 35.0636 32.148L33.7499 33.4549V28.1822C34.2757 28.207 34.8027 28.0695 35.2523 27.7814C35.5143 27.6133 35.8528 27.6134 36.1148 27.7814C36.5299 28.0475 37.011 28.1854 37.4964 28.1854C37.5367 28.1854 37.5768 28.1834 37.6171 28.1815V33.4549ZM43.2149 20.8873C43.156 21.1072 43.0122 21.2858 42.81 21.3903C41.9255 21.8476 41.3837 22.7858 41.43 23.7805C41.4407 24.0079 41.3578 24.2217 41.1969 24.3827C41.0359 24.5437 40.8221 24.6263 40.5947 24.6159C39.5995 24.5699 38.6618 25.1113 38.2045 25.9959C38.1 26.1981 37.9214 26.3419 37.7015 26.4008C37.4817 26.4596 37.255 26.4245 37.0635 26.3017C36.6442 26.0329 36.1639 25.8986 35.6834 25.8986C35.2031 25.8986 34.7226 26.033 34.3034 26.3017C34.1118 26.4244 33.8852 26.4596 33.6653 26.4008C33.4454 26.3419 33.2668 26.198 33.1623 25.9959C32.705 25.1114 31.7675 24.5694 30.7721 24.6159C30.5452 24.6264 30.3309 24.5437 30.1699 24.3827C30.0089 24.2217 29.9261 24.0079 29.9368 23.7804C29.9694 23.0784 29.7081 22.4053 29.2411 21.9088C29.2274 21.8938 29.2134 21.879 29.1987 21.8649C29.0132 21.6769 28.7983 21.5152 28.5568 21.3903C28.3546 21.2858 28.2108 21.1072 28.152 20.8873C28.0931 20.6674 28.1282 20.4408 28.2511 20.2493C28.7886 19.4109 28.7886 18.3276 28.2511 17.4893C28.1283 17.2977 28.0931 17.071 28.152 16.8511C28.2108 16.6313 28.3547 16.4526 28.5569 16.3481C29.4414 15.8908 29.9831 14.9527 29.9368 13.958C29.9262 13.7306 30.0091 13.5167 30.17 13.3557C30.3309 13.1947 30.5452 13.1121 30.7722 13.1225C31.7675 13.1687 32.7051 12.6272 33.1623 11.7426C33.2668 11.5403 33.4455 11.3966 33.6654 11.3377C33.8852 11.2789 34.1119 11.3139 34.3034 11.4368C35.1418 11.9743 36.2252 11.9743 37.0634 11.4368C37.255 11.314 37.4816 11.2787 37.7015 11.3377C37.9214 11.3966 38.1 11.5404 38.2045 11.7426C38.6618 12.6271 39.5999 13.169 40.5947 13.1225C40.8222 13.1122 41.0359 13.1947 41.1969 13.3557C41.3579 13.5167 41.4407 13.7306 41.43 13.958C41.3838 14.9526 41.9254 15.8908 42.8101 16.3481C43.0122 16.4526 43.156 16.6312 43.2149 16.8511C43.2738 17.071 43.2387 17.2977 43.1158 17.4892C42.5783 18.3275 42.5783 19.4109 43.1158 20.2492C43.2387 20.4408 43.2739 20.6674 43.2149 20.8873Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M39.8639 16.4784C39.5207 16.1351 38.9641 16.1351 38.6209 16.4784L35.7037 19.3956L34.5424 18.2343C34.1992 17.8911 33.6427 17.8911 33.2994 18.2343C32.9562 18.5775 32.9562 19.1341 33.2994 19.4774L35.0822 21.2601C35.2538 21.4318 35.4787 21.5176 35.7036 21.5176C35.9286 21.5176 36.1536 21.4318 36.3251 21.2601L39.8639 17.7214C40.2071 17.3782 40.2071 16.8217 39.8639 16.4784Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M10.7288 10.6286C10.5653 10.4651 10.3386 10.3711 10.1074 10.3711C9.87627 10.3711 9.64951 10.4651 9.48604 10.6286C9.32256 10.7921 9.22852 11.0188 9.22852 11.25C9.22852 11.4812 9.32256 11.7079 9.48604 11.8714C9.64951 12.0349 9.87627 12.1289 10.1074 12.1289C10.3386 12.1289 10.5653 12.0349 10.7288 11.8714C10.8923 11.7079 10.9863 11.4812 10.9863 11.25C10.9863 11.0188 10.8923 10.7921 10.7288 10.6286Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M17.666 10.3711H13.3887C12.9033 10.3711 12.5098 10.7646 12.5098 11.25C12.5098 11.7354 12.9033 12.1289 13.3887 12.1289H17.666C18.1515 12.1289 18.545 11.7354 18.545 11.25C18.545 10.7646 18.1515 10.3711 17.666 10.3711Z" fill="#2B2F31" fill-opacity="0.75"/>
                <path d="M26.6162 25.8398H16.5684C16.0829 25.8398 15.6895 26.2333 15.6895 26.7188C15.6895 27.2042 16.0829 27.5977 16.5684 27.5977H26.6161C27.1015 27.5977 27.495 27.2042 27.495 26.7188C27.495 26.2333 27.1016 25.8398 26.6162 25.8398Z" fill="#2B2F31" fill-opacity="0.75"/>
              </svg>
              Сертифікати:
            </div>
            <p>ТОВ “Агро-Рось”, ТМ “Повний Фарш - М’ясний сервіс”</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="middle_item">
            <div class="top_cnt">
              <svg width="67" height="75" viewBox="0 0 67 75" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0)">
                  <path d="M56.5905 53.6133C55.1673 53.6133 54.0148 54.9242 54.0148 56.543C54.0148 58.1617 55.1673 59.4727 56.5905 59.4727C58.0136 59.4727 59.1661 58.1617 59.1661 56.543C59.1661 54.9242 58.0136 53.6133 56.5905 53.6133Z" fill="#2B2F31"/>
                  <path d="M55.3027 41.8945C54.5918 41.8945 54.0148 42.5508 54.0148 43.3594C54.0148 44.1679 54.5918 44.8242 55.3027 44.8242C56.0135 44.8242 56.5905 44.1679 56.5905 43.3594C56.5905 42.5508 56.0135 41.8945 55.3027 41.8945Z" fill="#2B2F31"/>
                  <path d="M17.1832 53.6133C15.76 53.6133 14.6075 54.9242 14.6075 56.543C14.6075 58.1617 15.76 59.4727 17.1832 59.4727C18.6063 59.4727 19.7588 58.1617 19.7588 56.543C19.7588 54.9242 18.6063 53.6133 17.1832 53.6133Z" fill="#2B2F31"/>
                  <path d="M61.4801 36.129L59.2597 26.0262C60.049 25.1673 60.4539 24.028 60.4539 22.8516C60.4539 20.4283 58.7209 18.457 56.5905 18.457H46.2879V14.0625C46.2879 11.6392 44.5549 9.66797 42.4244 9.66797H4.82012C2.68969 9.66797 0.956665 11.6392 0.956665 14.0625V52.1484C0.956665 54.5717 2.68969 56.543 4.82012 56.543H9.45627C9.45627 61.3895 12.9223 65.332 17.1832 65.332C21.4441 65.332 24.9101 61.3895 24.9101 56.543H48.8635C48.8635 61.3895 52.3296 65.332 56.5905 65.332C60.8513 65.332 64.3174 61.3895 64.3174 56.543C64.3174 56.4594 64.3139 56.3765 64.3118 56.2929C65.8135 55.6904 66.893 54.0602 66.893 52.1484V43.3594C66.893 39.7179 64.5448 36.6898 61.4801 36.129ZM56.8727 27.2461L58.8044 36.0352H48.109L51.0619 32.6763C51.5649 32.1041 51.5649 31.1771 51.0619 30.6049C50.5588 30.0327 49.7439 30.0327 49.2408 30.6049L46.2879 33.9632V27.2461H56.8727ZM57.8783 22.8516C57.8783 23.6601 57.3013 24.3164 56.5905 24.3164H46.2879V21.3867H56.5905C57.3008 21.3867 57.8783 22.0436 57.8783 22.8516ZM17.1832 62.4023C14.3429 62.4023 12.0319 59.7736 12.0319 56.543C12.0319 53.2682 14.3847 50.6836 17.1832 50.6836C19.9882 50.6836 22.3345 53.2751 22.3345 56.543C22.3345 59.7736 20.0234 62.4023 17.1832 62.4023ZM24.4679 53.6133C23.3924 50.1566 20.4812 47.7539 17.1832 47.7539C13.8837 47.7539 10.9715 50.1583 9.89795 53.6133H4.82012C4.10981 53.6133 3.5323 52.9564 3.5323 52.1484V14.0625C3.5323 13.2545 4.10981 12.5977 4.82012 12.5977H42.4244C43.1348 12.5977 43.7123 13.2545 43.7123 14.0625V53.6133H24.4679ZM56.5905 62.4023C53.7502 62.4023 51.4392 59.7736 51.4392 56.543C51.4392 53.2682 53.792 50.6836 56.5905 50.6836C59.3955 50.6836 61.7417 53.2751 61.7417 56.543C61.7417 59.7736 59.4307 62.4023 56.5905 62.4023ZM63.7836 53.3335C62.6412 50.0273 59.7989 47.7539 56.5905 47.7539C53.2909 47.7539 50.3787 50.1583 49.3052 53.6133H46.2879V38.9648H60.4539C62.1326 38.9648 63.5643 40.1894 64.096 41.8945H60.4539C59.7426 41.8945 59.1661 42.5503 59.1661 43.3594C59.1661 44.1685 59.7426 44.8242 60.4539 44.8242H64.3174V52.1484C64.3174 52.6354 64.1061 53.0668 63.7836 53.3335Z" fill="#2B2F31"/>
                  <path d="M23.6223 18.457C17.2315 18.457 12.0319 24.3713 12.0319 31.6406C12.0319 38.9099 17.2315 44.8242 23.6223 44.8242C30.0131 44.8242 35.2127 38.9099 35.2127 31.6406C35.2127 24.3713 30.0131 18.457 23.6223 18.457ZM23.6223 41.8945C18.6516 41.8945 14.6076 37.2946 14.6076 31.6406C14.6076 25.9867 18.6516 21.3867 23.6223 21.3867C28.593 21.3867 32.637 25.9867 32.637 31.6406C32.637 37.2946 28.593 41.8945 23.6223 41.8945Z" fill="#2B2F31"/>
                  <path d="M28.7736 30.1758H24.9101V25.7812C24.9101 24.9722 24.3336 24.3164 23.6223 24.3164C22.911 24.3164 22.3345 24.9722 22.3345 25.7812V31.6406C22.3345 32.4497 22.911 33.1055 23.6223 33.1055H28.7736C29.4849 33.1055 30.0614 32.4497 30.0614 31.6406C30.0614 30.8315 29.4849 30.1758 28.7736 30.1758Z" fill="#2B2F31"/>
                </g>
                <defs>
                  <clipPath id="clip0">
                    <rect width="65.9363" height="75" fill="white" transform="translate(0.956665)"/>
                  </clipPath>
                </defs>
              </svg>
              Доставка:
            </div>
            <p>ТОВ “Агро-Рось”, ТМ “Повний Фарш - М’ясний сервіс”</p>
          </div>
        </div>
      </div>
      <!--* DESCRIPTION TXT *-->
      <div class="row product_description">
        <div class="prod_desc_title">Опис</div>
        <h2><?php echo $heading_title; ?></h2>
        <div class="description"><?php echo $description ?></div>
      </div>

      <!--*  Related products  *-->

      <div class="row related_posts">
        <?php if ($products) { ?>
        <h3><?php // echo $text_related; ?> Схожі товари</h3>
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-6 col-md-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              </div>
              <button type="button" class="to_wish" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
