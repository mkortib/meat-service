<?php echo $header; ?>

    <section class="s_delivery">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php if ($breadcrumb == end($breadcrumbs)) : ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php else : ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php endif ?>
                <?php } ?>
                <li class="active_breadcrumb"><a href="http://meat-servise/katalog">Доставка та оплата</a></li>
            </ul>
        </div>
        <div class="overlay">
            <h2>Ознакомтесь с нашими условиями доставки и оплаты</h2>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-xs-offset-1">
                    <div class="del_top_info">
                        <strong>Повний фарш - м’ясний сервіс </strong>– первый в Украине производитель и поставщик мраморного мяса. Компания основана в мае 2015 года и начинала свою деятельность с пятью сотрудниками на 20 м². В июне того же года был открыт фирменный магазин мяса на Столичном рынке, запущен информационный сайт и заработал интернет-магазин. Сегодня компания T-Bone вошла в стадию активного роста и развития. У нас есть собственные производственные площади, и мы не планируем останавливаться на достигнутом.
                    </div>
                    <div class="del_info_items">
                        <div class="del_item">
                            <div class="title">
                                <img src="/image/catalog/icons/delivery-truck.svg" alt="delivery">
                                Доставка
                            </div>
                            <p>Доставка м’ясної продукції по м.Києву здійснюється нашим власним спеціалізованим автотранспортом наступного дня після оформлення замовлення. Про бажаний час отримання продукції Ви можете домовитись із Вашим персональним менеджером.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<?php echo $footer; ?>