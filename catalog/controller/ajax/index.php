<?php
// catalog/controller/ajax/index.php
class ControllerAjaxIndex extends Controller {
    public function index() {
        $this->load->language('ajax/index');
        $this->load->model('catalog/product');

        $this->document->setTitle($this->language->get('heading_title'));

        // загружаем все товары
        $products = $this->model_catalog_product->getProducts();
        $data['products'] = $products;

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('ajax/index'),
            'text' => $this->language->get('heading_title')
        );

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_product_dropdown_label'] = $this->language->get('text_product_dropdown_label');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/ajax/index.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/ajax/index.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/ajax/index.tpl', $data));
        }
    }

    // метод вызова ajax
    public function ajaxGetProduct() {
        if (isset($this->request->get['product_id'])) {
            $product_id = (int) $this->request->get['product_id'];

            if ($product_id > 0) {
                // загружаем определенный товар, запрошенный в ajax
                $this->load->model('catalog/product');
                $product = $this->model_catalog_product->getProduct($product_id);
                $data['product'] = $product;

                // подготавливаем превью изображения
                $this->load->model('tool/image');
                if ($product['image']) {
                    $data['thumb'] = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
                }

                // форматируем цену
                $data['price'] = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));

                $this->load->language('product/product');
                $data['text_manufacturer'] = $this->language->get('text_manufacturer');
                $data['text_model'] = $this->language->get('text_model');
                $data['text_note'] = $this->language->get('text_note');
                $data['tab_description'] = $this->language->get('tab_description');

                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/ajax/product.tpl')) {
                    $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/ajax/product.tpl', $data));
                } else {
                    $this->response->setOutput($this->load->view('default/template/ajax/product.tpl', $data));
                }
            }
        }
    }
}