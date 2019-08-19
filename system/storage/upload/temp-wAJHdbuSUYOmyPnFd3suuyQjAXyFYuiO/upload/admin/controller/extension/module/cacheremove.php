<?php

ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

class ControllerExtensionModuleCacheremove extends Controller {
	private function log($test_mode = false, $data = '', $title = false) {
		if (!$test_mode)
			return false;

		$dir = str_replace('system/', '', DIR_SYSTEM);

		if (is_string($data)) {
			$str = '';

			if ($title)
				$str = "$title : ";

			$str .= $data;

			file_put_contents(
				$dir . "cacheremove.log", date("Y/m/d H:i:s") . ": \r\n"
				. $str
				. "\r\n------------------------------------------\r\n", FILE_APPEND | LOCK_EX
			);
		} else {
			ob_start();

			if ($title)
				echo "$title:\n";
			else
				echo "Array\n";

			print_r($data);

			$c = ob_get_contents();

			ob_clean();

			file_put_contents(
				$dir . "cacheremove.log", date("Y/m/d H:i:s") . ": \r\n"
				. "$c"
				. "\r\n------------------------------------------\r\n", FILE_APPEND | LOCK_EX
			);
		}
	}

	public function index() {
		$this->language->load('extension/module/cacheremove');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title']			 = $this->language->get('heading_title');
		$data['text_cacheremove']		 = $this->language->get('text_cacheremove');
		$data['text_data']					 = $this->language->get('text_data');
		$data['text_author']				 = $this->language->get('text_author');
		$data['text_author_support'] = $this->language->get('text_author_support');
		$data['text_image']					 = $this->language->get('text_image');
		$data['btn_clear']					 = $this->language->get('btn_clear');

		$data['token'] = $this->session->data['token'];

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/cacheremove', 'token=' . $this->session->data['token'], true),
		);

		$data['action']	 = $this->url->link('extension/module/cacheremove', 'token=' . $this->session->data['token'], true);
		$data['cancel']	 = $this->url->link('extension/module/cacheremove', 'token=' . $this->session->data['token'], true);

		$data['cache_data']	 = "system/storage/cache";
		$data['cache_image'] = "image/cache";

		$data['header']			 = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']			 = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/cacheremove', $data));
	}

	public function delete() {
		$json = array();
		$test_mode = false;

		$this->language->load('extension/module/cacheremove');

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && !empty($this->request->post['path'])) {
			$dir_home	= str_replace('admin/', '', DIR_APPLICATION);

			$path = $dir_home . $this->request->post['path']; // full path from home dir

			if (is_dir($path)) {
				$res = $this->truncateDir($path, $test_mode);
			}

			// answers
			if (count($res) > 0) {
				$json['answer'] = '<i class="fa fa-exclamation"> </i> ' . $this->language->get('text_error_files') . "<br/>";

				foreach ($res as $error) {
					$json['answer']	 .= str_replace($dir_home, '', $error) . "<br/>";
					$json['type']		 = "alert-danger";
				}
			} else {
				$json['answer'] = '<i class="fa fa-check"> </i> ' . $this->language->get('text_success') . "<br/>";
				$json['type'] = "alert-success";
			}

			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}

	private function truncateDir($dir, $test_mode = false, $errors = array(), $level = 0) {
		$this->log($test_mode, 'truncateDir() is called with level $level and \$dir ' . $dir . ' & $level ' . $level);

		$items = glob($dir . '/*'); // get all file names

		$this->log($test_mode, $items, '$items');

		foreach ($items as $item) {
			$delete_file = true;

			if (is_file($item)) {
				$this->log($test_mode, 'is file ' . $item);

				if ($level == 0 && false !== strpos($item, 'index')) {
					$delete_file = false;
				}

				if ($delete_file) {
					if (!$this->deleteFile($item, $test_mode)) {
						$errors[] = $item;
					}
				}
			} else {
				if (is_dir($item)) {
					$errors0 = $this->truncateDir($item, $test_mode, $errors, $level + 1);

					if (count($errors0) < 1) {
						if (!@rmdir($item)) {
							$errors[] = 'Can\'t delete ' . $item;
						}
					} else {
						$errors = array_merge($errors, $errors0);
					}
				}
			}
		}

		return $errors;
	}

	private function deleteFile($path, $test_mode = false) {
		$this->log($test_mode, 'deleteFile() is called with ' . $path);

		if (@unlink($path)) {
			$this->log($test_mode, $path . ' is deleted');
			return true;
		} else {
			$this->log($test_mode, $path . ' is NOT deleted');
			return false;
		}

		return false;
	}


}
