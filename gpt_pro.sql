/*
 Navicat Premium Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 50651 (5.6.51)
 Source Host           : localhost:3306
 Source Schema         : gpt_pro

 Target Server Type    : MySQL
 Target Server Version : 50651 (5.6.51)
 File Encoding         : 65001

 Date: 29/05/2023 22:57:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `value` tinyint(1) DEFAULT '0' COMMENT '系统开关',
  `name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `remark` varchar(255) DEFAULT NULL,
  `id` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of features
-- ----------------------------
BEGIN;
INSERT INTO `features` (`value`, `name`, `remark`, `id`) VALUES (1, 'chat', '聊天', 'f7cfedcb-e193-4d0d-a6e1-8cdc09582de0');
INSERT INTO `features` (`value`, `name`, `remark`, `id`) VALUES (1, 'system', '系统', 'b4952ae4-c3c8-46c1-2c66-2191a3ceda1e');
INSERT INTO `features` (`value`, `name`, `remark`, `id`) VALUES (1, 'payment', '支付', '25d5f6a2-a8d1-5eb8-3789-e88ed370c0d4');
INSERT INTO `features` (`value`, `name`, `remark`, `id`) VALUES (1, 'empower', '授权', '5b727804-57cb-3d17-572e-7dfd1501123f');
COMMIT;

-- ----------------------------
-- Table structure for openai_keys
-- ----------------------------
DROP TABLE IF EXISTS `openai_keys`;
CREATE TABLE `openai_keys` (
  `value` varchar(255) DEFAULT NULL,
  `hasEnable` tinyint(1) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `sensitiveId` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of openai_keys
-- ----------------------------
BEGIN;
INSERT INTO `openai_keys` (`value`, `hasEnable`, `id`, `sensitiveId`) VALUES ('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', 1, 'faadcc22-70cc-3825-53ed-25308154142f', NULL);
INSERT INTO `openai_keys` (`value`, `hasEnable`, `id`, `sensitiveId`) VALUES ('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', 1, 'a9b975b7-9628-c2e6-54f1-085c8142457a', NULL);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `remainQuantity` int(11) DEFAULT NULL COMMENT '剩余次数',
  `remainDays` int(11) DEFAULT NULL COMMENT '剩余天数',
  `id` varchar(60) NOT NULL COMMENT '订单Id',
  `packageId` varchar(60) NOT NULL COMMENT '套餐Id',
  `orderTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `paymentId` varchar(60) NOT NULL COMMENT '商户订单Id',
  `userId` varchar(60) NOT NULL COMMENT '用户Id',
  `status` varchar(10) NOT NULL DEFAULT 'PENDING' COMMENT '支付状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 33, '2908757CBF8E4521979E0A8B73086099', '3dd24786-4384-63d1-3003-3815666b09e7', '2023-05-28 23:59:59', '4200001873202305122189202529', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '77058DDCDBEF4C6083B8C13F46BFB1EF', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-14 00:47:49', 'free', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '56B5BB458FCF449898072A92B4F4D5CC', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-14 00:47:36', 'free', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (6, 99999, '10E5AAE446034FABA1A55CC90FFCE5C7', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-14 12:17:04', 'free', 'oJpU36Hq2AJVRfW3ci7r3US_lxfI', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, -2, 'E37E485491EE46C6A9EE8019D84CC86F', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, -2, 'A9BF31DB1783426881059D6CA4D91F1F', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, -2, 'C033B1AF6DBF41BA8029F9EBED9920B2', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, -2, 'F79B6231EAC14790A0D8046F95D8292D', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '4200001867202305145380074577', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, -2, '770AB39D43444D2299D06C8B21417CAD', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, -2, 'B8F6E225ED2D42DCB34FC3F23C1ABCF9', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '4200001863202305148211318997', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, -2, '1139E7523F7F49638683E2DCD150326E', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, -2, 'A919F72196224F8A950C769F263F97B4', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '4200001868202305147100036994', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (1000, 79, '6ACB3AF835B44938B494B3D4DA3895A4', 'aa1d29d5-aa75-1e46-a3be-dbbfd3fe225d', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, 'CD0410D5031C417EAFAA7D4F8D8F0CA2', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-16 23:28:01', 'free', 'oJpU36E_Pr_dUMJl3IuAZwLoRIE0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '09DD4859F9774319B8945F9A6C56C540', 'bfaef950-e4da-51c5-2cab-37de4c4a903b', '2023-05-15 21:15:25', '4200001880202305150392403561', 'oJpU36E_Pr_dUMJl3IuAZwLoRIE0', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '36B3F0BC0A8C4434891DA1612280FBF3', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '9575D9527BC64D28BFB88A7DC5FFF9C0', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '4200001866202305163521243033', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '66E96AC2730C4190AA3BB14621F61D8B', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '9428BCA55F284AD1B8F26BC2B396CE90', 'bfaef950-e4da-51c5-2cab-37de4c4a903b', '2023-05-16 13:27:55', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '1F5A8424FFBC452F9299E8BF3ABFE7E0', 'bfaef950-e4da-51c5-2cab-37de4c4a903b', '2023-05-16 13:28:05', '4200001864202305167618459726', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '42D9B144AC6A473F9076434C4A5FE2C9', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-19 23:59:59', '4200001851202305163709566335', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (300, 18, '01EB85790AB74C5E83E7EDD1509019BA', 'e49c1861-1099-f5c8-745f-c68e09ec7d04', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '3999D951069D4BBFBE49D493C9D93893', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '', 'oJpU36HiQUxQQygkXs7OBScx1IVk', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'A154784565224AE3989BA29E45B45B6B', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (4, 99999, 'D2C8D51443AB4A7C8E022BF096FCA368', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-16 21:16:03', 'free', 'oJpU36NfBGLJgMx8zcxQSqesgfHQ', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '27F25ACAC08A45DDB41A40F0B0F417DA', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-18 15:21:01', 'free', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, 'EF5145ED6D2F4247BCA3FC673DCC6F3C', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-16 23:33:01', 'free', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '1B92C95BB5B6405D9145E453A9E3FE12', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-16 23:56:01', 'free', 'oJpU36IORK_4y5Up7g9TXvVS2IMU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (6, 0, 'EF983E2BC4114C3287CE7752ECF1B752', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '4200001878202305165149614545', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, 'CC8CC1ADE5E0405EB880AC43A09B93D0', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-23 00:00:01', '', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, '70E23FED45E24ABA9C09AE84D38E13E7', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-23 00:00:01', '', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, '754D953F111B49059781B23FE9976CFD', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-23 00:00:01', '', 'oJpU36IORK_4y5Up7g9TXvVS2IMU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (3, 0, '6E1E158AF61D407C97741CEA8FBABC83', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '4200001861202305163036634930', 'oJpU36IORK_4y5Up7g9TXvVS2IMU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'A51BF3DDF69B4D1288249C688D4B3298', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 00:00:01', '', 'oJpU36IORK_4y5Up7g9TXvVS2IMU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '775FB82EC89A441195E594621C5EAB6C', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-21 00:00:01', '', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '7B18126DD3F44308B811E3F8121B2E7A', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-20 23:59:59', '4200001869202305179077285612', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '00399CE0B3AB4ED2A5DB8AEA4489375E', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-17 12:43:01', 'free', 'oJpU36MhO9qNHni_-NyO5Ac8v5qs', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'E4536CF3401A4F4BBB5024E545FE42B7', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-24 00:00:01', '4200001857202305176477524031', 'oJpU36MhO9qNHni_-NyO5Ac8v5qs', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'BF9C86A6CA944FCA8F54F0D497EF5098', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-21 00:00:01', '', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (99999, 99999, '37ef777b-a2eb-e0b7-0c2e-e22f2b1bc043', '7d3d7f94-e259-de27-4e01-0f85ab6cba54', '2023-05-17 08:00:00', 'VVIP', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, 'D8C34E69848E46359F876A0DA796099D', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-18 00:53:01', 'free', 'oJpU36Iecd6DXQTRdVCFl0HkxX3Q', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '7239536B11884AFC84E69A0A76796355', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-22 00:00:01', '', 'oJpU36Iecd6DXQTRdVCFl0HkxX3Q', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '914D1906A61247A5918D314940E349F0', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-21 23:59:59', '4200001872202305185314722378', 'oJpU36Iecd6DXQTRdVCFl0HkxX3Q', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, '242152B9A28C446AAC0426236D8A6C4C', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-22 00:00:01', '4200001869202305189850619553', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '280471D8153E41D9997D3C61EFB333E5', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-21 23:59:59', '4200001865202305183997085696', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (6, 99999, 'D4FA39B3687C486DB057199ECA28C358', 'f908e2af-943e-1252-5674-9c1141e68869', '0000-00-00 00:00:00', 'free', 'oJpU36CxaRY_LQnwyPlukSdV_Ynk', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, '80AC8556DEDA4AE7881BD9EC7740E744', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-21 23:59:59', '4200001869202305183532710191', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '126D062FB4444BBC9415CF0914ABA3C5', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-18 19:49:01', 'free', 'oJpU36JcRh7--RPMYmdBQ4TnDTF0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (3, 0, '87B26BC2A3A34F5180B77BE718F78CE4', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-22 00:00:01', '4200001866202305187217570234', 'oJpU36JcRh7--RPMYmdBQ4TnDTF0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (4, 99999, '1A5DABB916DC49CAA41B3D2E64A27E1F', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-28 15:49:58', 'free', 'oJpU36LlsyuDM1IeTnnA7gGko4IE', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (1, 99999, 'CF16763E1B054303A75489AA52C8C4F1', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-25 20:58:49', 'free', 'oJpU36FRy7hibvhiLCuBR5chIGns', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 0, 'FA5F334D946C4A8E98D6B6FD66C33D1E', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-23 23:59:59', '4200001879202305205643816030', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, 'E6497BE58D03438094B51D30F6AFE069', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-27 00:00:01', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '1FAC82E61D10453092E8485C07E9DD80', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-20 18:17:01', 'free', 'oJpU36Gwrc81OtDbs1hXwGFXnbrc', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, '9763415CFB6D4F7284348188861CAA37', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-27 00:00:01', '', 'oJpU36Gwrc81OtDbs1hXwGFXnbrc', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, '718972E939AC4BE0892BE1ACF1BA99E1', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-27 00:00:01', '', 'oJpU36Gwrc81OtDbs1hXwGFXnbrc', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 99999, '37F3E0F5389E40CA90F8B3ADE551C85E', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-20 19:41:53', 'free', 'oJpU36LiNI3WrbS-vcmhBLOGi3gU', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 0, 'D1D5A0B00D034AB29E7382730F95B0FC', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-25 00:00:01', '4200001857202305210646085878', 'oJpU36Gwrc81OtDbs1hXwGFXnbrc', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 0, '8D31FBBA05DB4C4589E867791D9D89FE', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 00:00:01', '', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, 'A0FF344533424E91B56C74F122DA51FB', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-22 22:22:01', 'free', 'oJpU36I5J_Jy0A2Lij9AeTgd4yeM', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 0, 'F13154D7E00E4DBAAE697116C30399C0', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-25 00:00:01', '4200001861202305215826754584', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'BDB5F1BECD704EF896B58E28D4753B97', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-25 00:00:01', '4200001866202305216262526488', 'oJpU36I5J_Jy0A2Lij9AeTgd4yeM', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'D9911F8987574309A3F8EBB2131CFCF2', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-25 00:00:01', '', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 0, 'CA67FB3F50C1467284AFF882FF94451E', '975bc04d-7b78-0d36-67e4-491c370c9fb0', '2023-05-25 00:00:01', '4200001862202305214226196445', 'oJpU36FRy7hibvhiLCuBR5chIGns', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '9EEC71BB200F4F669C2F28DEFCF669BB', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-23 00:50:01', 'free', 'oJpU36CzzqzeRTk4oPTb_qdTkAho', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 1, '0137405C6C6E4359976674AD0CD4871B', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36CzzqzeRTk4oPTb_qdTkAho', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (9, 1, '611F0B72F9B944E0A1567FF1F5F91B9D', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '4200001856202305236298071418', 'oJpU36CzzqzeRTk4oPTb_qdTkAho', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 1, '0590F75636E149B5BF7CA2FC3A57EBC4', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 1, 'B5C01500414742E2B7773F2075B352AC', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 1, '66E604240FA04173BEFE2EA40067037B', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '4200001880202305236493931639', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 3, 'A25C43530AF845DAA8F8581F5ACF51C9', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '4200001882202305255570025887', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 99999, '5BA35E196CA8424786896C0D1D88E469', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-25 20:34:51', 'free', 'oJpU36PUf7QfZt0XZE0SvBGLSnqk', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (2, 99999, 'F72188D68A45415AA5D90896B34881CF', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-27 22:18:12', 'free', 'oJpU36IVzuaxmxm8TBGoymZ4EwDU', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (6, 99999, '3E869246B8C5457497BD3842B503FD85', 'f908e2af-943e-1252-5674-9c1141e68869', '0000-00-00 00:00:00', 'free', 'oJpU36LoQ0pV28SKc7CqdRQVKRw0', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (0, 99999, '640A6230AF564D1E830F0F88C3A7AC14', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-26 01:23:01', 'free', 'oJpU36L8tukGWh16UhCz0NzemBGo', 'INVALID');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (7, 4, '7105B096909F45AD84774CF587357CCF', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-29 19:32:14', '4200001878202305267161331399', 'oJpU36L8tukGWh16UhCz0NzemBGo', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 4, '3BD7D560158C4DB882FA198436C112C5', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '4200001880202305261346305328', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (9, 4, 'F003DE895BDE4B3CB8082CE53E75736D', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '4200001855202305262824342337', 'oJpU36MhO9qNHni_-NyO5Ac8v5qs', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (300, 28, '8F94340B496A42D98EB71F40CC511793', 'e49c1861-1099-f5c8-745f-c68e09ec7d04', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 4, '3B9A409E42734B049CD4732E38E14760', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (300, 28, '8BBE33B614C1431E920B28372E3210A4', 'e49c1861-1099-f5c8-745f-c68e09ec7d04', '2023-05-28 23:59:59', '', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (4, 99999, '59C8AEE2635B4C33A6539CF4947E593D', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-27 20:23:13', 'free', 'oJpU36JzAtHKlamXU-sHYbEjK9rA', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (5, 6, '5B013AB92261492DA4101CA524381F48', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-29 13:32:13', '4200001855202305285406622764', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (4, 99999, '0CBBC813A5594694B6F80C35AD41C74E', 'f908e2af-943e-1252-5674-9c1141e68869', '2023-05-28 20:03:43', 'free', 'oJpU36NvWvykBtMxoNMH7peE-CuM', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 6, '3EEEDA3BEA094CCFA7FA915355E30BB0', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36LlsyuDM1IeTnnA7gGko4IE', 'PENDING');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (6, 99999, '9FADF3BBF4B5493689F174672ADA308B', 'f908e2af-943e-1252-5674-9c1141e68869', '0000-00-00 00:00:00', 'free', 'oJpU36GzP8Q3ZyKCjljcifwYMN9Q', 'SUCCESS');
INSERT INTO `orders` (`remainQuantity`, `remainDays`, `id`, `packageId`, `orderTime`, `paymentId`, `userId`, `status`) VALUES (10, 6, '7C090BC68241411B92A461F46767EB09', 'a12b2182-c405-bc58-6bbe-1463d95edcb5', '2023-05-28 23:59:59', '', 'oJpU36NvWvykBtMxoNMH7peE-CuM', 'PENDING');
COMMIT;

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `money` int(11) NOT NULL COMMENT '金额',
  `id` varchar(60) NOT NULL COMMENT '唯一id\n',
  `effectiveDuration` int(11) DEFAULT NULL COMMENT '有效天数',
  `maxQuantity` int(11) DEFAULT NULL COMMENT '总次数',
  `listingTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '上架时间',
  `name` varchar(255) NOT NULL,
  `hasEnable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of packages
-- ----------------------------
BEGIN;
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (1, '3dd24786-4384-63d1-3003-3815666b09e7', 50, 15, '2023-05-12 22:31:50', '体验套餐', 0);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (0, 'f908e2af-943e-1252-5674-9c1141e68869', 99999, 6, '2023-05-12 22:32:15', '新用户免费套餐', 0);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (290, 'a12b2182-c405-bc58-6bbe-1463d95edcb5', 7, 10, '2023-05-12 22:31:17', '体验套餐', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (3900, 'e49c1861-1099-f5c8-745f-c68e09ec7d04', 31, 300, '2023-05-12 22:35:27', '月套餐-初级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (8800, '92bf33fd-0a83-5f8b-451c-b9b12dce2761', 31, 99999, '2023-05-12 22:34:24', '月套餐-高级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (9900, 'aa1d29d5-aa75-1e46-a3be-dbbfd3fe225d', 93, 1000, '2023-05-12 22:38:00', '季套餐-初级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (19900, 'abdc3373-ec61-908a-8e0a-2ec8f797ac24', 93, 99999, '2023-05-12 22:39:12', '季套餐-高级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (29900, '54b8fd15-ba4a-f896-5692-a95b83cff54f', 365, 5000, '2023-05-12 22:38:46', '年套餐-初级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (39900, '5e1789ce-f843-53fc-5bb4-e0022faf2f9b', 365, 99999, '2023-05-12 22:39:56', '年套餐-高级', 1);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (1, 'bfaef950-e4da-51c5-2cab-37de4c4a903b', 99999, 99999, '2023-05-16 23:19:38', '开发测试套餐', 0);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (1, '975bc04d-7b78-0d36-67e4-491c370c9fb0', 4, 7, '2023-05-23 21:45:58', '阳总请测试', 0);
INSERT INTO `packages` (`money`, `id`, `effectiveDuration`, `maxQuantity`, `listingTime`, `name`, `hasEnable`) VALUES (1, '7d3d7f94-e259-de27-4e01-0f85ab6cba54', 99999, 99999, '2023-05-17 22:42:34', 'VVIP套餐', 0);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL,
  `headimgurl` text,
  `openid` varchar(60) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36CBXO7fRnu7t8jUIG54R8KU', '2023-05-11 23:57:08', '严家辉', 'https://thirdwx.qlogo.cn/mmopen/vi_32/x3EA9yicjt0KmeQ0FnDf9tIDichuN5BtMsrxAqwpJAP3jqUgt8LM89OJKVc4d2I1bCBAiaFWfGFq5ZpQry0sX9w0g/132', 'oJpU36CBXO7fRnu7t8jUIG54R8KU', '严家辉');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36HiQUxQQygkXs7OBScx1IVk', '2023-05-14 00:04:20', '阳锅锅', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibashTHtGDWJ4Ym43ibxey1TSh9zwKUZyMGkGibCatbhWy5A3WjlUlImRMf6qI01LiaoqJCWLI79Szw/132', 'oJpU36HiQUxQQygkXs7OBScx1IVk', '阳锅锅');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36Hq2AJVRfW3ci7r3US_lxfI', '2023-05-14 12:17:04', '丁小五℡¹⁸⁰ ⁵⁵⁰⁰ ⁸³³³', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoKRpN6ZM9jAqAmAfWA2JOjAIGtBiaBerNyQ2MzCeI2pV4hVxV9ejbEYiaOL7Fucf1v0yRxoOiaWRhTw/132', 'oJpU36Hq2AJVRfW3ci7r3US_lxfI', '丁小五℡¹⁸⁰ ⁵⁵⁰⁰ ⁸³³³');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36E_Pr_dUMJl3IuAZwLoRIE0', '2023-05-15 21:14:02', '芊芊子-', 'https://thirdwx.qlogo.cn/mmopen/vi_32/g2kSbj5Mzav2mUjiaT7DA3kJS5KbvOToiasAIlfuF8jw0JYXz7UibggF3bnvTdSFyXM3CPJS82nSHsDY1hoLaUwUg/132', 'oJpU36E_Pr_dUMJl3IuAZwLoRIE0', '芊芊子-');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36NfBGLJgMx8zcxQSqesgfHQ', '2023-05-16 21:15:54', '羁客（付费  白嫖勿扰）', 'https://thirdwx.qlogo.cn/mmopen/vi_32/IIibWdv4lz3hrLr8NhWxZ09iawicl10aCx1ESicCMWDOIyVZt48fLFKib53YGuYVI5TtwwSF0aEZAkWT2wKqOPAMvaw/132', 'oJpU36NfBGLJgMx8zcxQSqesgfHQ', '羁客（付费  白嫖勿扰）');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36DzchnAEhrOhWlZsaTS1Yew', '2023-05-16 22:54:20', '.', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCWvBNibib8VvLTWTibNnrpTqLpciajZxLGiadCcmyXe484SeiaAajBqOdFSGZ3IugcviaibhPtbcOly3l8w/132', 'oJpU36DzchnAEhrOhWlZsaTS1Yew', '.');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36OKAmVKVKT1ynmemEM9X8K0', '2023-05-16 22:56:29', '居舍旅行183 5700 5600', 'https://thirdwx.qlogo.cn/mmopen/vi_32/PMxC3hj0bIw82ByOsLZHaZloeiaxAV2iaLd9Ke5TJYo1728e5rEdK5OArTOUvzYSQEiageMH9DIttxibTfwznutVBw/132', 'oJpU36OKAmVKVKT1ynmemEM9X8K0', '居舍旅行183 5700 5600');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36IORK_4y5Up7g9TXvVS2IMU', '2023-05-16 23:04:11', '庄邻加', 'https://thirdwx.qlogo.cn/mmopen/vi_32/mA81IV0yCj55COG56SPLicQaZiciassZ6icPnabCalJfECp1EtfBxOuI9YZXQiaYsnZb1CXL1m7CJyLCqKbjYftjYNQ/132', 'oJpU36IORK_4y5Up7g9TXvVS2IMU', '庄邻加');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36MhO9qNHni_-NyO5Ac8v5qs', '2023-05-17 12:07:28', 'Anna', 'https://thirdwx.qlogo.cn/mmopen/vi_32/MY9lpHk6lv29zdOlo6TUVODjEZtlV1R487k0pXAiaXZUFFp36oJMyB1icCccBicX6peIhmttQ0dbCO9A0dlXQrSGg/132', 'oJpU36MhO9qNHni_-NyO5Ac8v5qs', 'Anna');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36Iecd6DXQTRdVCFl0HkxX3Q', '2023-05-18 00:48:32', '阿豪', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL7ThpKYniaO7HsGJvNTY8KVxHcLSCAXf0KiaCkSySKheOoHQCJUvibKMsKja8qoEmaGjd4FKhD7hXaw/132', 'oJpU36Iecd6DXQTRdVCFl0HkxX3Q', '阿豪');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36CxaRY_LQnwyPlukSdV_Ynk', '2023-05-18 17:17:46', '何必当初', 'https://thirdwx.qlogo.cn/mmopen/vi_32/yXnndqaOfgFDNIfnwLb9jpbKwGkDVuCMsrnylcbNwn1Mkwhked66pmw0lB8q6UXiaXRes2XWjFQRGsE7hNAks4g/132', 'oJpU36CxaRY_LQnwyPlukSdV_Ynk', '何必当初');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36JcRh7--RPMYmdBQ4TnDTF0', '2023-05-18 19:43:26', '回收高档礼品名酒购物卡黄金银元', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo1LTzy4tydia9jJUpjqlqzyBz7rVania5tmIAia1QwACwqSVATcyX8X9xU5mHicTS4KeGnX8NGbgCoUA/132', 'oJpU36JcRh7--RPMYmdBQ4TnDTF0', '回收高档礼品名酒购物卡黄金银元');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36LlsyuDM1IeTnnA7gGko4IE', '2023-05-19 21:17:00', '東·', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eribEUXkU8UicNx8mlhUA0muBibbibER0AYwPWLp3auOZpKUKZOhBR9cBVhGdDjiaDVDKBDib8vnGI4EBww/132', 'oJpU36LlsyuDM1IeTnnA7gGko4IE', '東·');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36FRy7hibvhiLCuBR5chIGns', '2023-05-19 22:01:13', '曾庆路', 'https://thirdwx.qlogo.cn/mmopen/vi_32/LUp6vWyfkW2tDSN27whZEURW6W0VcFHMhwWz9fFxcO6d6iarPJuOxZ7mibC3O55RyCDnyskp7DSYzKYxtbjJ1QRA/132', 'oJpU36FRy7hibvhiLCuBR5chIGns', '曾庆路');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36Gwrc81OtDbs1hXwGFXnbrc', '2023-05-20 18:11:06', '王一帆', 'https://thirdwx.qlogo.cn/mmopen/vi_32/CvMwXnTHxIZF6crFDNYnKGejXKAelYJ9TLkLhOBUqbJUEL9z9gC34GKg9rAODibsDwgkdrMzj46f7e1fuhIRTvw/132', 'oJpU36Gwrc81OtDbs1hXwGFXnbrc', '王一帆');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36LiNI3WrbS-vcmhBLOGi3gU', '2023-05-20 19:41:46', '庄邻加', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX6OUtp7qnErGNmMhWuv4ic86rNhTOZ2icfkZ3QnviaYJYg35cw4iaPHGnrWB7Rm3sJ3eKkmlWnBDJ7A/132', 'oJpU36LiNI3WrbS-vcmhBLOGi3gU', '庄邻加');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36I5J_Jy0A2Lij9AeTgd4yeM', '2023-05-21 18:36:14', '芦目世纪家电13678602188', 'https://thirdwx.qlogo.cn/mmopen/vi_32/gg40RpvZw73icTBmibfAIol0DQjdUJ61TibokNzvQeSobybTooIB8XI5F9WWib4c9Pia1oib7bQJLBZo7QP2ia2drf8TA/132', 'oJpU36I5J_Jy0A2Lij9AeTgd4yeM', '芦目世纪家电13678602188');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36CzzqzeRTk4oPTb_qdTkAho', '2023-05-23 00:24:33', '王晓旭', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL4iaFVrBXoB81UFnUibKJuhBNZhobibnllfPNS1Iv3S1j8Jic0JWickXiatmXoDms8eaTvibp4mOlblTvlw/132', 'oJpU36CzzqzeRTk4oPTb_qdTkAho', '王晓旭');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36PUf7QfZt0XZE0SvBGLSnqk', '2023-05-25 20:34:42', '领航手机维修配件  高其 不做欠款', 'https://thirdwx.qlogo.cn/mmopen/vi_32/9yxKEm5h5IcJJUq585zIOqknhXHjapXx0JIKdeyDicZYibMpiaVECIOIvjNHZQ9yNsCkBMBEeGnWolYvricjaR685Q/132', 'oJpU36PUf7QfZt0XZE0SvBGLSnqk', '领航手机维修配件  高其 不做欠款');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36IVzuaxmxm8TBGoymZ4EwDU', '2023-05-25 20:47:47', '维修铺子（手机维修）', 'https://thirdwx.qlogo.cn/mmopen/vi_32/X1lGUnkuEbpeTKL51rrvqJgdicQG5a83zkBm5DX7uoHBicXZSy0Wr6J1Wy7icyiarwN8Cta7ia8eLJ5on46hRQgwUEQ/132', 'oJpU36IVzuaxmxm8TBGoymZ4EwDU', '维修铺子（手机维修）');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36LoQ0pV28SKc7CqdRQVKRw0', '2023-05-25 20:49:33', '美好的一天', 'https://thirdwx.qlogo.cn/mmopen/vi_32/BNxCMUpjhvRsLialib0ibcmsqCXVkMzrKdAfVGyQEuVEHZaAOMxEC7zjM0EYCanHGzUvccbolCopIyt2x7MJXzo6A/132', 'oJpU36LoQ0pV28SKc7CqdRQVKRw0', '美好的一天');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36L8tukGWh16UhCz0NzemBGo', '2023-05-26 01:01:40', '李文明15068159181', 'https://thirdwx.qlogo.cn/mmopen/vi_32/OibicxCVMhZbySX6ibOevv5aiaHtHEeBpvPEDzlRskicotCsN0a1gw1KBOhypUNpD5Trg1L5odI1icRrejh5xicdic7WOg/132', 'oJpU36L8tukGWh16UhCz0NzemBGo', '李文明15068159181');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36JzAtHKlamXU-sHYbEjK9rA', '2023-05-27 20:18:13', 'mmsnd.', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkXQfFicnNSB4gPKGUibaEUcuM2rArSb3OJhhJU8psPLGxTqs4nIa6BwrEyWpm99Ko9VX1E1OHfH8g/132', 'oJpU36JzAtHKlamXU-sHYbEjK9rA', 'mmsnd.');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36NvWvykBtMxoNMH7peE-CuM', '2023-05-28 10:44:20', '少₇一点₈ ᰔᩚ', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrOmvUpzibbFYxQVwKFYCZjGlWtewSUtINecKpWXIvB2dOAxbu6T1Tib8S9HiaKBeXh0AR31FfDtibFA/132', 'oJpU36NvWvykBtMxoNMH7peE-CuM', '少₇一点₈ ᰔᩚ');
INSERT INTO `users` (`id`, `createTime`, `nickname`, `headimgurl`, `openid`, `name`) VALUES ('oJpU36GzP8Q3ZyKCjljcifwYMN9Q', '2023-05-28 17:04:48', '。', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIk798g2JF9EN6trG23AbuzqIyPQWaA01vVXe1unIylsCMFtVqTSHLt5ty78ialKhzqyJ0Rn0ibHOWg/132', 'oJpU36GzP8Q3ZyKCjljcifwYMN9Q', '。');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
