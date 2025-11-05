/*
 Navicat Premium Data Transfer

 Source Server         : bakery store
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : bakery_store

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 25/12/2024 12:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `quantity` int NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (0, '');
INSERT INTO `kategori` VALUES (1, 'bread');
INSERT INTO `kategori` VALUES (2, 'patry');
INSERT INTO `kategori` VALUES (3, 'cakes');
INSERT INTO `kategori` VALUES (4, 'cookies');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_id` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ketersediaan_stok` enum('habis','tersedia') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'tersedia',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  INDEX `kategori_produk`(`kategori_id` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  CONSTRAINT `kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 1, 'melon pan', 15000, 'melon pan.jpeg', 'Nikmati kelembutan roti dengan tekstur renyah di luar dan lembut di dalam, berpadu dengan rasa manis yang khas. Roti ini terinspirasi dari roti tradisional Jepang, memberikan sensasi makan yang unik di setiap gigitan.', 'tersedia');
INSERT INTO `produk` VALUES (2, 1, 'toast', 20000, 'toast.jpeg', 'Roti panggang yang sempurna untuk menemani pagi Anda! Dengan lapisan luar yang garing dan isi yang lembut, Toast ini bisa disantap dengan berbagai topping sesuai selera, dari selai hingga cokelat.', 'tersedia');
INSERT INTO `produk` VALUES (3, 2, 'croissant wave', 25000, 'croissant wave.jpeg', 'Croissant renyah dan buttery, dipadu dengan kreasi rasa inovatif yang menggugah selera. Dengan bentuk dan tekstur yang unik, Croissant Wave hadir dengan sentuhan khas yang pasti membuat Anda ketagihan.', 'tersedia');
INSERT INTO `produk` VALUES (4, 2, 'cat cream puff', 20000, 'cat cream puff.jpeg', 'Dessert lucu dengan tampilan imut, berisi krim lembut yang lumer di mulut! Paduan rasa manis dan tekstur renyah dari puff pastry membuat Cat Cream Puff jadi pilihan tepat untuk menyenangkan hati.', 'tersedia');
INSERT INTO `produk` VALUES (5, 2, 'churros', 15000, 'churros.jpeg', 'Camilan khas Spanyol dengan rasa manis dan tekstur renyah di luar, lembut di dalam. Churros kami disajikan dengan taburan gula dan kayu manis, serta dipasangkan dengan cokelat leleh yang memanjakan lidah.', 'tersedia');
INSERT INTO `produk` VALUES (6, 3, 'strawberry roll cake', 30000, 'strawberry roll cake.jpeg', 'Kue bolu lembut yang dipadukan dengan krim vanilla dan potongan stroberi segar, membentuk roll cake yang menggugah selera. Setiap gigitannya menghadirkan sensasi manis dan segar yang pas!', 'tersedia');
INSERT INTO `produk` VALUES (7, 3, 'baby castella', 15000, 'baby castella.jpeg', 'Kue jiggly ala Jepang dengan tekstur super lembut dan rasa manis yang lembut. Baby Castella adalah pilihan tepat untuk cemilan santai yang tidak hanya enak, tetapi juga menggemaskan!', 'tersedia');
INSERT INTO `produk` VALUES (8, 3, 'mini custom cake', 50000, 'custom cake.jpeg', 'Ciptakan kue mini sesuai selera Anda! Dengan desain yang bisa disesuaikan, Mini Custom Cake cocok untuk berbagai acara spesial. Nikmati kue dengan rasa yang unik dan tampilan yang cantik!', 'tersedia');
INSERT INTO `produk` VALUES (9, 1, 'fluffy pancake', 20000, 'fluffy_pancake.jpeg', 'yang fluffy', 'tersedia');
INSERT INTO `produk` VALUES (10, 3, 'HBD cake', 50000, 'hbd cake.jpg', NULL, 'tersedia');
INSERT INTO `produk` VALUES (11, 4, 'choco chip', 20000, 'chip choco.jpeg', NULL, 'tersedia');
INSERT INTO `produk` VALUES (12, 4, 'cat cookies', 20000, 'cookies.jfif', NULL, 'tersedia');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user 1', '123');

SET FOREIGN_KEY_CHECKS = 1;
