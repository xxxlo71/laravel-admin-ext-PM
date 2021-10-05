/*
 Navicat Premium Data Transfer

 Source Server         : 172.23.96.12_oneone 新正式機_測試機
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 172.23.96.12:3306
 Source Schema         : oneone_test

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 05/10/2021 10:32:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_config
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_config_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39074 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner_click
-- ----------------------------
DROP TABLE IF EXISTS `banner_click`;
CREATE TABLE `banner_click`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水編',
  `bl_id` int(10) NOT NULL COMMENT '被點擊的廣告代碼',
  `created_at` datetime(0) NOT NULL COMMENT '被點擊的時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT 'laravel bug 不可使用',
  `who` int(10) NULL DEFAULT NULL COMMENT '會員代碼/未登入者為0',
  `from_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '點擊來源/無法獲得為空',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner_list
-- ----------------------------
DROP TABLE IF EXISTS `banner_list`;
CREATE TABLE `banner_list`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '廣告代碼',
  `bp_id` int(11) NOT NULL COMMENT '廣告版位代碼',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '廣告圖片/影片網址',
  `go_web_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '點擊廣告後前往web網址',
  `go_ios_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '點擊廣告後前往iOS網址',
  `go_android_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '點擊廣告後前往android網址',
  `start_at` datetime(0) NULL DEFAULT NULL COMMENT '廣告開始時間',
  `end_at` datetime(0) NULL DEFAULT NULL COMMENT '廣告結束時間',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '廣告類型 (1:圖片, 2:Youtube)',
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '廣告開關 (1:開啟, 2:關閉)',
  `target` tinyint(10) NOT NULL DEFAULT 1 COMMENT '廣告開啟方式 (1:_blank 2.:_self )',
  `sort_by` int(10) NULL DEFAULT NULL COMMENT '廣告排序',
  `created_at` datetime(0) NOT NULL COMMENT '廣告建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '廣告更新時間',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '廣告說明',
  `image_id` int(10) NULL DEFAULT NULL COMMENT '廣告圖片的id 取代url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner_position
-- ----------------------------
DROP TABLE IF EXISTS `banner_position`;
CREATE TABLE `banner_position`  (
  `bp_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '廣告版位代碼',
  `height` smallint(6) NOT NULL COMMENT '廣告版位高度',
  `width` smallint(6) NOT NULL COMMENT '廣告版位寬度',
  `created_at` datetime(0) NOT NULL COMMENT '廣告版位建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '廣告版位更新時間',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '廣告版位說明',
  `script_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '廣告版位補充前端語法',
  PRIMARY KEY (`bp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `parent` int(10) NULL DEFAULT NULL COMMENT '上層代碼',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分類名稱',
  `display` tinyint(10) NOT NULL DEFAULT 1 COMMENT '1:開啟,2:關閉',
  `sort_by` int(10) UNSIGNED NOT NULL COMMENT '排序 (0:自然排序 1~99 由先到後)',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort_by`(`sort_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coins_order
-- ----------------------------
DROP TABLE IF EXISTS `coins_order`;
CREATE TABLE `coins_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `showid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '顯示訂單號',
  `user_id` int(10) NOT NULL COMMENT '會員編號',
  `coins` int(10) NOT NULL COMMENT '購買代幣金額',
  `source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '交易來源',
  `status` int(11) NULL DEFAULT 1 COMMENT '交易狀態 1:訂單建立 2:訂單成立 3.訂單派送 4.訂單結束',
  `pay_status` int(11) NULL DEFAULT 1 COMMENT '付款狀態 1:未付款 2:已付款 3:付款失敗 4:已開立發票',
  `pay_at` datetime(0) NULL DEFAULT NULL COMMENT '付款時間',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `showid`(`showid`) USING BTREE,
  INDEX `user_id`(`showid`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 713 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coins_setting
-- ----------------------------
DROP TABLE IF EXISTS `coins_setting`;
CREATE TABLE `coins_setting`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `name` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代幣名稱',
  `denomination` int(10) NOT NULL COMMENT '面額',
  `display` tinyint(10) NOT NULL COMMENT '顯示 1:開啟 2:關閉 3.刪除',
  `image_id` int(10) NOT NULL COMMENT '代幣圖片',
  `sort_by` int(10) NULL DEFAULT NULL COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coins_transaction
-- ----------------------------
DROP TABLE IF EXISTS `coins_transaction`;
CREATE TABLE `coins_transaction`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `user_id` int(10) NOT NULL COMMENT '會員代碼',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '購物車代碼',
  `source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '點數來源',
  `showid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '來源序號',
  `coins` int(10) NOT NULL DEFAULT 0 COMMENT '交易代幣',
  `point` int(10) NULL DEFAULT 0 COMMENT '獲得/消費紅利',
  `mode` int(10) NULL DEFAULT 0 COMMENT '交易模式 1:ecpay 2:7-11 3:全家 4:官網',
  `params` json NULL COMMENT '交易雜湊',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `showid`(`showid`, `user_id`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5830 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ichibansho_detail
-- ----------------------------
DROP TABLE IF EXISTS `ichibansho_detail`;
CREATE TABLE `ichibansho_detail`  (
  `product_id` int(11) NOT NULL,
  `paper` json NULL COMMENT '籤紙',
  `paper_log` json NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ichibansho_gift
-- ----------------------------
DROP TABLE IF EXISTS `ichibansho_gift`;
CREATE TABLE `ichibansho_gift`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) NULL DEFAULT 0 COMMENT '供應商編號',
  `bind_product_id` int(10) NULL DEFAULT 0 COMMENT '綁定商品',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'last' COMMENT '類型',
  `gift_info` json NULL COMMENT '擴充包',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登記的訂單',
  `user_id` int(32) NULL DEFAULT 0 COMMENT '登記的使用者',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bind_product_id`(`bind_product_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ichibansho_log
-- ----------------------------
DROP TABLE IF EXISTS `ichibansho_log`;
CREATE TABLE `ichibansho_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT 'user_id',
  `supplier_id` int(10) NOT NULL COMMENT '供應商編號',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '產品編號',
  `product_kinds_id` int(10) NOT NULL DEFAULT 0 COMMENT '品項編號',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '產品名稱',
  `product_kinds_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '品項名稱',
  `product_kinds_img_id` int(11) NULL DEFAULT 0 COMMENT '品項圖片',
  `gift_info` json NULL,
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_id`(`cart_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1728 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ichibansho_order
-- ----------------------------
DROP TABLE IF EXISTS `ichibansho_order`;
CREATE TABLE `ichibansho_order`  (
  `ichibansho_id` bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT 'user_id',
  `supplier_id` int(10) NULL DEFAULT 0 COMMENT '供應商編號',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '產品編號',
  `product_kinds_id` int(10) NOT NULL DEFAULT 0 COMMENT '品項編號',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '產品名稱',
  `product_kinds_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '品項名稱',
  `product_kinds_img_id` int(11) NULL DEFAULT 0 COMMENT '品項圖片',
  `gift_info` json NULL COMMENT '擴充用',
  `status` int(11) NULL DEFAULT 100 COMMENT '100-未抽取 200-已抽取 ',
  `order_inx` int(11) NULL DEFAULT 0 COMMENT '未抽取時抽獎優先順序',
  `draw_date` datetime(0) NULL DEFAULT NULL COMMENT '抽獎時間',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`ichibansho_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `cart_id`(`cart_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12099 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for image_upload
-- ----------------------------
DROP TABLE IF EXISTS `image_upload`;
CREATE TABLE `image_upload`  (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NULL DEFAULT NULL COMMENT '從後台上傳圖片的人代碼',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '從前台上傳圖片的人代碼',
  `img_disk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `img_root` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `img_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `img_sub` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `img_status` int(11) NOT NULL DEFAULT 0,
  `img_cron` int(11) NULL DEFAULT 0,
  `img_save` int(11) NULL DEFAULT 0,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '從前台上傳圖片的路徑',
  `admin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '從後台上傳圖片的路徑',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `save_inx`(`img_status`, `img_cron`, `img_save`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2506 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logistic_ecpay_log
-- ----------------------------
DROP TABLE IF EXISTS `logistic_ecpay_log`;
CREATE TABLE `logistic_ecpay_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '訂單編號',
  `shipping_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '貨運通路',
  `shipping_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '出貨編號',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單請求時間',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單逾期時間',
  `extra_info` json NULL COMMENT '運送資訊',
  `trans_info` json NULL COMMENT '拋轉資訊',
  `co_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '廠商交易編號',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '出貨時間',
  `arrival_time` datetime(0) NULL DEFAULT NULL COMMENT '到達時間',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`, `shipping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logs_event
-- ----------------------------
DROP TABLE IF EXISTS `logs_event`;
CREATE TABLE `logs_event`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaign` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` json NULL,
  `logs_cdate_key` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `created_at` datetime(0) NULL DEFAULT '0000-01-01 00:00:00',
  `updated_at` datetime(0) NULL DEFAULT '0000-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `campaign_inx`(`campaign`, `logs_cdate_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130808 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for movie_list
-- ----------------------------
DROP TABLE IF EXISTS `movie_list`;
CREATE TABLE `movie_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'youtube 網址',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '圖片網址 gcs 模式',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '圖片網址 admin模式',
  `title` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '標題',
  `author` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `click` int(10) NULL DEFAULT NULL COMMENT '點擊數',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告代碼',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告標題',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告內容',
  `display` tinyint(10) NOT NULL DEFAULT 1 COMMENT '公告開關 (1:開啟, 2:關閉)',
  `sort_by` int(10) NULL DEFAULT NULL COMMENT '公告排序',
  `created_at` datetime(0) NOT NULL COMMENT '公告建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '公告更新時間',
  `image_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告圖片的id 取代url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sort_by`(`sort_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_ecpay_log
-- ----------------------------
DROP TABLE IF EXISTS `payment_ecpay_log`;
CREATE TABLE `payment_ecpay_log`  (
  `order_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(8) NOT NULL,
  `order_time` datetime(0) NOT NULL COMMENT '訂單請求時間',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單逾期時間',
  `extra_info` json NULL COMMENT '虛擬帳號/繳費代碼/條碼資訊',
  `amount` int(5) NOT NULL COMMENT '請求金額',
  `trade_amount` int(5) NULL DEFAULT NULL COMMENT '交易金額',
  `currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `co_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '廠商交易編號',
  `payment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '付款方式',
  `payment_type_charge_fee` int(10) NULL DEFAULT NULL COMMENT '通路費',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單確認時間',
  `transation_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單給點時間',
  `usage_type` tinyint(3) NULL DEFAULT 2 COMMENT '2:一般,3:已支付,4:測試,5:調退',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `order_time`(`order_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_invoice
-- ----------------------------
DROP TABLE IF EXISTS `payment_invoice`;
CREATE TABLE `payment_invoice`  (
  `order_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訂單號',
  `user_id` int(10) NOT NULL COMMENT '會員編號',
  `invoice_amount` int(5) NOT NULL DEFAULT 0 COMMENT '發票金額',
  `cash_fee` int(10) NOT NULL DEFAULT 0 COMMENT '手續費',
  `invoice_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '發票號碼',
  `random_number` int(5) NULL DEFAULT NULL COMMENT '隨機碼',
  `invoice_date` datetime(0) NULL DEFAULT NULL COMMENT '開立發票時間',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '1捐贈2個人3統編',
  `status` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '狀態 0 未開立 1已開立 1500047 開立發票失敗(查無可使用字軌或發票號碼) 4:已作廢',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '發票建立/接收時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  `invoice_info` json NULL COMMENT '發票資訊',
  `channel` tinyint(10) NOT NULL COMMENT '儲值渠道 1:Line_ALL 2:Credit_CreditCard 3:CVS_CVS',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `invoice_number`(`invoice_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_linepay_log
-- ----------------------------
DROP TABLE IF EXISTS `payment_linepay_log`;
CREATE TABLE `payment_linepay_log`  (
  `order_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(8) NOT NULL,
  `order_time` datetime(0) NOT NULL COMMENT '訂單請求時間',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單逾期時間',
  `extra_info` json NULL COMMENT '虛擬帳號/繳費代碼/條碼資訊',
  `amount` int(5) NOT NULL COMMENT '請求金額',
  `trade_amount` int(5) NULL DEFAULT NULL COMMENT '交易金額',
  `currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `co_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '廠商交易編號',
  `payment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '付款方式',
  `payment_type_charge_fee` int(10) NULL DEFAULT NULL COMMENT '通路費',
  `confirm_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單確認時間',
  `transation_time` datetime(0) NULL DEFAULT NULL COMMENT '訂單給點時間',
  `usage_type` tinyint(3) NULL DEFAULT 2 COMMENT '2:一般,3:已支付,4:測試,5:調退',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `order_time`(`order_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment_method_list
-- ----------------------------
DROP TABLE IF EXISTS `payment_method_list`;
CREATE TABLE `payment_method_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代幣名稱',
  `order_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '棄用 改type_name',
  `type_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代幣名稱',
  `type_name_sub` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代幣名稱',
  `class_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '代幣名稱',
  `fee_type` tinyint(1) NULL DEFAULT 0 COMMENT '0固定面額1為%',
  `fee` float NULL DEFAULT 0 COMMENT '代幣名稱',
  `fee_free_money` int(5) NOT NULL DEFAULT 0 COMMENT '0最低付款金額',
  `allow_money` int(5) NOT NULL DEFAULT 0 COMMENT '0最低付款金額',
  `images_url` json NULL COMMENT '代幣後台圖示',
  `display` tinyint(1) NOT NULL DEFAULT 2 COMMENT '顯示 1:開啟 2:關閉',
  `sort_by` tinyint(3) NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `category` json NOT NULL COMMENT '標籤',
  `category_id` int(10) NOT NULL DEFAULT 0 COMMENT '分類代碼',
  `global_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '國際條碼',
  `supplier_id` int(10) NOT NULL COMMENT '供應商代碼',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '產品名稱',
  `short_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '產品名稱 截字版',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '簡介',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '說明',
  `read_before_buying` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '購買前請閱讀',
  `sales_method` json NOT NULL COMMENT '銷售方式 (1:扭蛋,2:成套購買,3:一番賞,4:盲盒,99:最後賞)',
  `price` int(10) NULL DEFAULT 0 COMMENT '代幣單抽',
  `special_price` int(10) NULL DEFAULT NULL COMMENT '特惠價',
  `redraw_price` int(10) NULL DEFAULT NULL COMMENT '重抽價',
  `point` int(10) NULL DEFAULT 0 COMMENT '代幣單抽 紅利 (可為0)',
  `tag` json NULL COMMENT '標籤',
  `last_gift` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最後賞(一番賞臨時用)',
  `restrict` json NULL COMMENT '限制標籤',
  `show_at` datetime(6) NULL DEFAULT NULL COMMENT '上架時間',
  `off_at` datetime(6) NULL DEFAULT NULL COMMENT '下架時間',
  `status` int(10) NOT NULL DEFAULT 200 COMMENT '商品狀態 200:正常 100:缺貨  ( 不影響整體商品的上下架)',
  `display` int(10) NOT NULL COMMENT '顯示狀態 1:顯示 2:隱藏 3:刪除',
  `roll` int(10) NULL DEFAULT 0 COMMENT '首次重骰順序',
  `sort` int(10) NULL DEFAULT 0 COMMENT '順序',
  `created_at` datetime(6) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(6) NOT NULL COMMENT '更新時間',
  `images_id` json NULL COMMENT '商品圖片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `display`(`display`) USING BTREE,
  INDEX `updated_at`(`updated_at`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_cart_detail`;
CREATE TABLE `product_cart_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '訂單編號',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT 'user_id',
  `supplier_id` int(10) NOT NULL COMMENT '供應商編號',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '產品編號',
  `product_kinds_id` int(10) NOT NULL DEFAULT 0 COMMENT '品項編號',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '產品名稱',
  `product_kinds_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '品項名稱',
  `product_kinds_img_id` int(11) NULL DEFAULT 0 COMMENT '品項圖片',
  `price` int(10) NOT NULL DEFAULT 0 COMMENT '價格',
  `point` int(10) NULL DEFAULT 0 COMMENT '紅利',
  `amount` int(10) NULL DEFAULT 1 COMMENT '數量',
  `buy_mode` int(11) NULL DEFAULT 1 COMMENT '購買模式 1.正常購買 10:重抽購買',
  `status` int(11) NULL DEFAULT 1 COMMENT '購物形態 1:已購買 20:已重抽 100:出貨中 200:退單中',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `showid`(`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_cart_header
-- ----------------------------
DROP TABLE IF EXISTS `product_cart_header`;
CREATE TABLE `product_cart_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '購買單號',
  `shipping_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '出貨單號',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'user_id',
  `supplier_id` int(10) NOT NULL COMMENT '供應商代碼',
  `status` int(11) NULL DEFAULT 1 COMMENT '狀態',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 459 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_cart_header_cancel
-- ----------------------------
DROP TABLE IF EXISTS `product_cart_header_cancel`;
CREATE TABLE `product_cart_header_cancel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `cancel_type` int(10) NOT NULL COMMENT '退單代碼 (1:按錯 2:客人取消 3:缺貨 4:其他原因)',
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '退單原因',
  `cancel_at` datetime(0) NOT NULL COMMENT '退單時間',
  `admin_id` int(10) NOT NULL COMMENT '管理者代碼',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_cart_header_redo
-- ----------------------------
DROP TABLE IF EXISTS `product_cart_header_redo`;
CREATE TABLE `product_cart_header_redo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `redo_type` int(10) NOT NULL COMMENT '補單代碼 (1:補償相關 2:行銷活動類 3:掉單要補單 4:公關贈品 5:其他原因)',
  `redo_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '補單原因',
  `redo_at` datetime(0) NOT NULL COMMENT '補單時間',
  `admin_id` int(10) NOT NULL COMMENT '管理者代碼',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  `new_cart_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '新補單編號',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_kinds
-- ----------------------------
DROP TABLE IF EXISTS `product_kinds`;
CREATE TABLE `product_kinds`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號(子)',
  `product_id` int(10) NOT NULL COMMENT '產品代碼(母)',
  `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '種類名稱',
  `original_amount` int(10) NOT NULL COMMENT '原始數量',
  `remain_amount` int(10) NULL DEFAULT 0 COMMENT '剩餘數量',
  `status` int(10) NULL DEFAULT 100 COMMENT '狀態 1:缺貨 100:正常',
  `sort_by` int(10) NULL DEFAULT 1 COMMENT '排序',
  `pusher` int(11) NULL DEFAULT 0 COMMENT '允許推播',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  `images_id` json NULL COMMENT '商品圖片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 928 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `product_id` int(11) NOT NULL COMMENT '產品代碼',
  `product_kinds_id` int(11) NULL DEFAULT 0 COMMENT '品項代碼',
  `status` int(11) NULL DEFAULT 0 COMMENT '抽取狀態',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`, `product_kinds_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1007454 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_shipping_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_shipping_detail`;
CREATE TABLE `product_shipping_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `shipping_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '單號',
  `supplier_id` int(10) NULL DEFAULT 0 COMMENT '供應商編號',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT 'user_id',
  `product_id` int(10) NOT NULL DEFAULT 0 COMMENT '產品編號',
  `product_kinds_id` int(10) NOT NULL DEFAULT 0 COMMENT '品項編號',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '產品名稱',
  `product_kinds_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '品項名稱',
  `product_kinds_img_id` int(11) NULL DEFAULT 0 COMMENT '品項圖片',
  `price` int(10) NOT NULL DEFAULT 0 COMMENT '價格',
  `amount` int(10) NULL DEFAULT 1 COMMENT '數量',
  `status` int(11) NULL DEFAULT 1 COMMENT '購買狀態 1.正常銷售',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shipping_id`(`shipping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4842 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_shipping_header
-- ----------------------------
DROP TABLE IF EXISTS `product_shipping_header`;
CREATE TABLE `product_shipping_header`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '單號',
  `supplier_id` int(10) NULL DEFAULT 0 COMMENT '供應商編號',
  `cart_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '來自購物單號',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'user_id',
  `shipping_type` int(11) NULL DEFAULT 1 COMMENT '出貨方式',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `total_price` int(11) NULL DEFAULT 0 COMMENT '出貨總價(20210915後全由品項加總)',
  `total_amount` int(11) NULL DEFAULT 0 COMMENT '出貨總數量(20210915後排除購物車為運費品項)',
  `fare` int(11) NULL DEFAULT 0 COMMENT '出貨運費(勿刪)(20210915後停止使用)',
  `status` int(11) NULL DEFAULT 1 COMMENT '單號狀態 (1:出貨中 200:已出貨 300:已退貨)',
  `co_logistics_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '三方物流單號',
  `shipping_company` int(11) NULL DEFAULT 0 COMMENT '出貨廠商/通路',
  `shipping_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '出貨單號',
  `extra_info` json NULL COMMENT '出貨資訊',
  `shipping_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shipping_id`(`shipping_id`) USING BTREE,
  UNIQUE INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 404 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_shipping_header_returned
-- ----------------------------
DROP TABLE IF EXISTS `product_shipping_header_returned`;
CREATE TABLE `product_shipping_header_returned`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shipping_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單編號',
  `supplier_id` int(10) NOT NULL COMMENT '供應商編號',
  `returned_type` int(10) NOT NULL COMMENT '退貨代碼',
  `returned_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '退貨原因',
  `returned_at` datetime(0) NOT NULL COMMENT '退貨時間',
  `admin_id` int(10) NOT NULL COMMENT '管理者代碼',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shipping_id`(`shipping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_shipping_header_shipped
-- ----------------------------
DROP TABLE IF EXISTS `product_shipping_header_shipped`;
CREATE TABLE `product_shipping_header_shipped`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) NOT NULL COMMENT '供應商編號',
  `shipping_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出貨編號',
  `shipped_company_id` int(10) NOT NULL COMMENT '貨運公司 (1:大榮貨運 2:宅配通)',
  `shipped_order_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '貨運單號',
  `shipped_at` datetime(0) NOT NULL COMMENT '出貨時間',
  `admin_id` int(10) NOT NULL COMMENT '管理者代碼',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shipping_id`(`shipping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_supplier
-- ----------------------------
DROP TABLE IF EXISTS `product_supplier`;
CREATE TABLE `product_supplier`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '供應商ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供應商名稱',
  `email` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '信箱',
  `free_shipping_amount` int(10) NULL DEFAULT NULL COMMENT '免運金額',
  `fare` int(10) NULL DEFAULT NULL COMMENT '運費',
  `status` tinyint(10) NULL DEFAULT NULL COMMENT '狀態 1:開啟 2:關閉 3:刪除',
  `images_id` int(10) NULL DEFAULT NULL COMMENT '供應商圖片',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report_daily
-- ----------------------------
DROP TABLE IF EXISTS `report_daily`;
CREATE TABLE `report_daily`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `show_date` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '顯示日期',
  `newbine` int(10) NULL DEFAULT NULL COMMENT '新增會員',
  `cumulative_newbine` int(10) NULL DEFAULT NULL COMMENT '[累積]新會員數',
  `login` int(10) NULL DEFAULT NULL COMMENT '登入會員數',
  `store_value` int(10) NULL DEFAULT NULL COMMENT '儲值金額',
  `cumulative_store_value` int(10) NULL DEFAULT NULL COMMENT '[累積]儲值金額',
  `store_member` int(10) NULL DEFAULT NULL COMMENT '儲值會員數',
  `consumption_value` int(10) NULL DEFAULT NULL COMMENT '消耗金額',
  `consumption_member` int(10) NULL DEFAULT NULL COMMENT '消耗會員數',
  `first_store_value` int(10) NULL DEFAULT NULL COMMENT '首儲金額',
  `first_store_member` int(10) NULL DEFAULT NULL COMMENT '首儲會員數',
  `waittoship_value` int(10) NULL DEFAULT NULL COMMENT '待出貨數',
  `shipped_value` int(10) NULL DEFAULT NULL COMMENT '已出貨數',
  `shipped_redo_value` int(10) NULL DEFAULT NULL COMMENT '總退貨數',
  `created_at` datetime(0) NOT NULL COMMENT '寫入時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `show_date`(`show_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `command` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '指令',
  `frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '頻率',
  `clock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分秒 00:00',
  `status` tinyint(10) NOT NULL COMMENT '1:開啟 2:關閉',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '指令說明',
  `sort_by` int(10) NULL DEFAULT NULL COMMENT '排序 (0:自然排序 1~99 由先到後)',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_serialize
-- ----------------------------
DROP TABLE IF EXISTS `table_serialize`;
CREATE TABLE `table_serialize`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `target_slot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `insert_id` bigint(20) UNSIGNED NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `target_slot`(`target_slot`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分類名稱',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NOT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_mail
-- ----------------------------
DROP TABLE IF EXISTS `temporary_mail`;
CREATE TABLE `temporary_mail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `recipient_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收者信箱',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '標題',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信件內容',
  `priority` int(10) NOT NULL COMMENT '權重數值越大 越先處理',
  `status` tinyint(10) NOT NULL COMMENT '1:未發送 2:發送中 3:發送完成',
  `attachments` json NULL COMMENT '附檔',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `priority`(`priority`, `created_at`) USING BTREE,
  INDEX `status`(`status`, `created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2592 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temporary_sms
-- ----------------------------
DROP TABLE IF EXISTS `temporary_sms`;
CREATE TABLE `temporary_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `recipient_sms` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收者手機',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '標題',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '簡訊內容',
  `priority` int(10) NOT NULL COMMENT '權重數值越大 越先處理',
  `status` tinyint(10) NOT NULL COMMENT '1:未發送 2:發送中 3:發送完成',
  `created_at` datetime(0) NOT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `priority`(`priority`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(11) UNSIGNED NOT NULL,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bind_user` int(11) NOT NULL DEFAULT 0,
  `reverse_bind_user` int(11) NOT NULL DEFAULT 0,
  `user_type` int(1) NOT NULL DEFAULT 1,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `block` int(1) NOT NULL DEFAULT 0,
  `verify` int(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_access
-- ----------------------------
DROP TABLE IF EXISTS `users_access`;
CREATE TABLE `users_access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `access_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stime` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_access`(`user_id`, `access_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1079 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_adjustment
-- ----------------------------
DROP TABLE IF EXISTS `users_adjustment`;
CREATE TABLE `users_adjustment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `user_id` int(10) NOT NULL COMMENT '會員名稱',
  `order_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '訂單號碼',
  `adj_status` tinyint(10) NOT NULL COMMENT '1:補代幣 2:扣除代幣',
  `coins` int(10) NOT NULL COMMENT '代幣數量',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '原因',
  `admin_id` int(10) NULL DEFAULT NULL COMMENT '調整負責人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_block
-- ----------------------------
DROP TABLE IF EXISTS `users_block`;
CREATE TABLE `users_block`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `user_id` int(10) NOT NULL COMMENT '會員代碼',
  `block_type` int(10) NOT NULL COMMENT '封鎖型態 (1:頻繁退貨 2:騷擾相關 3:詐騙帳號 4:違法相關 5:其他原因)',
  `block_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '封鎖原因',
  `status` int(10) NOT NULL COMMENT '停權狀態(1:正常 2:停權)',
  `admin_id` int(10) NOT NULL COMMENT '管理者代碼',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '封鎖時間',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `block_type`(`block_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_coins
-- ----------------------------
DROP TABLE IF EXISTS `users_coins`;
CREATE TABLE `users_coins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `user_id` bigint(20) NOT NULL COMMENT '會員代碼',
  `coins` int(11) NULL DEFAULT 0 COMMENT '代幣數量',
  `free_coins` int(11) NULL DEFAULT 0 COMMENT '代幣數量(無計價)',
  `accumulation_coins` int(11) NULL DEFAULT NULL COMMENT '代幣數量(累積)',
  `show_coins` int(11) NULL DEFAULT 0 COMMENT 'coins+free_coins',
  `point` int(10) NULL DEFAULT NULL COMMENT '紅利點數',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_detail
-- ----------------------------
DROP TABLE IF EXISTS `users_detail`;
CREATE TABLE `users_detail`  (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '性別',
  `birthday` date NULL DEFAULT '0000-01-01' COMMENT '生日',
  `vali_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '驗證信箱',
  `vail_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '驗證電話',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '連絡信箱',
  `prefix_phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '電話國碼',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '連絡電話',
  `region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '國家',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '城市',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '行政區',
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '地址',
  `job` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '職業',
  `etc` json NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
