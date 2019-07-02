<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Yt <?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<!-- favicon -->

<link rel="apple-touch-icon" sizes="57x57" href="/image/catalog/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/image/catalog/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/image/catalog/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/image/catalog/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/image/catalog/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/image/catalog/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/image/catalog/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/image/catalog/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/image/catalog/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/image/catalog/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/image/catalog/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/image/catalog/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/image/catalog/favicon/favicon-16x16.png">
<link rel="manifest" href="/image/catalog/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/image/catalog/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<!-- -->

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto:500,900&display=swap" rel="stylesheet">
<link href="catalog/view/theme/meat-service/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<script src="catalog/view/theme/meat-service/js/theme.min.js"></script>
</head>
<body class="<?php echo $class; ?>" id="body">
<?php if (!isset($this->request->get['route']) || (isset($this->request->get['route']) && $this->request->get['route'] == 'common/home')) { ?>
<!-- здесь вставить что-то только для главной страницы -->
<header class="main_header main_header_home">
    <div class="container-fluid">
        <div class="main_header_itms flex_element">

            <div class="burger_col flex_element align_center">
                <div class="mnu_button">
                    <button class="hamburger hamburger--collapse" type="button">
                              <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                              </span>
                    </button>
                    <span class="mnu_button_txt">Меню</span>
                </div>
            </div>

            <div class="header_phone_col flex_element align_center">
                <div class="header_phone_wr">
                    <a class="header_phone" href="tel:06666666"><img src="/image/catalog/icons/call-phone.svg" alt="">+38 044 123 45 67</a>
                </div>
            </div>

            <div class="logo_header_col flex_element align_center">
                <a href="#" class="logo logo_header">
                    <img src="/image/catalog/meat-service-logo.svg" alt="">
                </a>
            </div>

            <div class="nav_shop_col flex_element align_center d_none">
                <nav class="nav_shop">
                    <ul class="nav_shop_items">
                        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><img src="/image/catalog/icons/wishlist.svg" alt=""> </a></li>
                        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><img src="/image/catalog/icons/basket.svg" alt=""> </a></li>
                        <li class="dropdown user_acc"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle user_acc_link" data-toggle="dropdown"><img src="/image/catalog/icons/user.svg" alt=""> <span class="login_text">Вхід</span>  </a>
                            <ul class="dropdown-menu">
                                <?php if ($logged) { ?>
                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                <?php } else { ?>
                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<?php } else {?>
<!-- здесь вставить что-то для всех остальных страниц, кроме главной  -->
<header class="main_header">
    <div class="container-fluid">
        <div class="row flex_element">

            <div class="col-lg-2 flex_element align_center">
                <div class="mnu_button">
                    <button class="hamburger hamburger--collapse" type="button">
                          <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                          </span>
                    </button>
                    <span class="mnu_button_txt">Меню</span>
                </div>
            </div>

            <div class="col-lg-3 flex_element align_center">
                <div class="header_phone_wr">
                    <a class="header_phone" href="tel:06666666"><img src="/image/catalog/icons/call-phone.svg" alt="">+38 044 123 45 67</a>
                </div>
            </div>

            <div class="col-lg-2 flex_element align_center">
                <a href="#" class="logo logo_header">
                    <img src="/image/catalog/meat-service-logo.svg" alt="">
                </a>
            </div>

            <div class="col-lg-5 flex_element align_center">
                <nav class="nav_shop">
                    <ul class="nav_shop_items">
                        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><img src="/image/catalog/icons/wishlist.svg" alt=""> </a></li>
                        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><img src="/image/catalog/icons/basket.svg" alt=""> </a></li>
                        <li class="dropdown user_acc"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle user_acc_link" data-toggle="dropdown"><img src="/image/catalog/icons/user.svg" alt=""> <span class="login_text">Вхід</span>  </a>
                            <ul class="dropdown-menu">
                                <?php if ($logged) { ?>
                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                <?php } else { ?>
                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>
<?php } ?>