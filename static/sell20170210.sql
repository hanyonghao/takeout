/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sell

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-10 17:27:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for foods_ratings
-- ----------------------------
DROP TABLE IF EXISTS `foods_ratings`;
CREATE TABLE `foods_ratings` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `foods_id` varchar(32) DEFAULT NULL COMMENT '食物ID',
  `username` varchar(128) DEFAULT NULL COMMENT '用户名',
  `ratetime` bigint(32) DEFAULT NULL COMMENT '评论时间',
  `ratetype` tinyint(2) DEFAULT NULL COMMENT '评论类型',
  `text` varchar(1024) DEFAULT NULL COMMENT '评论内容',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='食物评论表';

-- ----------------------------
-- Records of foods_ratings
-- ----------------------------
INSERT INTO `foods_ratings` VALUES ('5620e5e3b0cc4d81b5d4972b289fc3b1', '8bccca1f8f0843a5a03db08b3aaf1620', '3******c', '1469281964000', '1', '没啥味道', 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png');
INSERT INTO `foods_ratings` VALUES ('75aa54d101cf4cd2933d60781c9bf199', '8bccca1f8f0843a5a03db08b3aaf1620', '2******3', '1469271264000', '0', null, 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png');
INSERT INTO `foods_ratings` VALUES ('75f11449f19a484c8790a3b552835a70', '5b43e87c5b204b14b142ebb2027a6619', '3******b', '1469261964000', '1', null, 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png');
INSERT INTO `foods_ratings` VALUES ('9263488b4ac1473b995dfd97d82ec3fc', '5b43e87c5b204b14b142ebb2027a6619', '3******c', '1469281964000', '1', '难吃不推荐', 'http://fuss10.elemecdn.com/f/28/a51e7b18751bcdf871648a23fd3b4jpeg.jpeg');
INSERT INTO `foods_ratings` VALUES ('b5f7e0f7c7844b4098f65ce4ad269bc7', '8bccca1f8f0843a5a03db08b3aaf1620', '3******c', '1469281964000', '0', null, 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg');
INSERT INTO `foods_ratings` VALUES ('c0de6480a372452baceb930e926b5d1a', '8bccca1f8f0843a5a03db08b3aaf1620', '3******c', '1469281964000', '0', '很喜欢的粥', 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png');
INSERT INTO `foods_ratings` VALUES ('c4929cc9480f4b8ba45c2df5d58f3d79', '8015a629e68f4c5084f4b5fc8397d433', '3******c', '1469271264000', '1', null, 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg');
INSERT INTO `foods_ratings` VALUES ('e20ff340960843aa81e8384b00fe172b', '8015a629e68f4c5084f4b5fc8397d433', '2******3', '1469271264000', '1', '很一般啊', 'http://fuss10.elemecdn.com/f/28/a51e7b18751bcdf871648a23fd3b4jpeg.jpeg');

-- ----------------------------
-- Table structure for goods_foods
-- ----------------------------
DROP TABLE IF EXISTS `goods_foods`;
CREATE TABLE `goods_foods` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '分组ID',
  `foods_id` varchar(32) DEFAULT NULL COMMENT '食物ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家产品分组关系表';

-- ----------------------------
-- Records of goods_foods
-- ----------------------------
INSERT INTO `goods_foods` VALUES ('006aa1577a4f43218b00e61adef5c6d9', '7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', '7303bb2904b04b0389e3253fadcaf1c0');
INSERT INTO `goods_foods` VALUES ('04b8cfd24191420a86893c8c686ce4ab', 'fd2acf050439441cadeb0fab2f2808f3', '7cbfba5e35124370845cdb6c141c9f9f');
INSERT INTO `goods_foods` VALUES ('0bac8cc7bc3f449880e50d3a074d6865', '81bba2db37184e30b4152e88f18a40ce', '7bc76762d9e94107a9ba41981a2a876f');
INSERT INTO `goods_foods` VALUES ('0fb3671f01704ad384dcdc4aec3f316c', '84d42445c1cb4e1286eb93677ca45673', '87e9163f47794e188de83e755c20b896');
INSERT INTO `goods_foods` VALUES ('1140ce1f3cc94a6299a55f32e81d3323', '7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', 'e7d79537e7ea4e72835ff9cbce5ae5cc');
INSERT INTO `goods_foods` VALUES ('13243a96190547f4b115f071025c825c', '84d42445c1cb4e1286eb93677ca45673', '7cbfba5e35124370845cdb6c141c9f9f');
INSERT INTO `goods_foods` VALUES ('18453f417eb04cb98cb039ebd8f542e5', '0ce5c4698fe94b6195b0444aae1400e2', '145f123963c64cc3820069e49e13e0e4');
INSERT INTO `goods_foods` VALUES ('18a1967cfbca4def8c63c5618a1420a2', 'f8f09d924a9c4d2db3b6b1b8970aaa7d', 'fc77699522774b328a580baf603751d3');
INSERT INTO `goods_foods` VALUES ('1984d59e587841ca8de7893bb8ca81de', '862574c9947a44449a29c668d503ff5a', '59f521aa83084b688d073a7cdf125ae4');
INSERT INTO `goods_foods` VALUES ('208e0f6657de465a99e236a8cf9c7b20', '94bc712693624b3c8de36286dca90009', '390a1c969cd84bb78a2acbc1e842313f');
INSERT INTO `goods_foods` VALUES ('23f3f901ec4f49318711365b0880257a', '7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', '665e1c52b93c4a27a9828eed3cbdfc5a');
INSERT INTO `goods_foods` VALUES ('27d29a8c90b24e538febcd9e5373eac3', 'e95c93f65d6e4ae18f5e3c32694994cc', '93efb4c9c8f2474f844eb716abbe9b61');
INSERT INTO `goods_foods` VALUES ('2aed1aa2c70c487d863d847f7d3a6e9d', '110fb0d583bf45e0a6c541c729c50688', '36e4ffe99fd74081a9cd50243897887e');
INSERT INTO `goods_foods` VALUES ('2ece0f847c534e1e8c8f4b77fc74eefc', 'f8f09d924a9c4d2db3b6b1b8970aaa7d', 'aaa67a7d046c47ea9afaa4daaa3e1b00');
INSERT INTO `goods_foods` VALUES ('2f41a66b367e411d85bc7ea86e185a79', 'e95c93f65d6e4ae18f5e3c32694994cc', '8bccca1f8f0843a5a03db08b3aaf1620');
INSERT INTO `goods_foods` VALUES ('3b2d617eb72b419282a88d2b73a336b8', 'e95c93f65d6e4ae18f5e3c32694994cc', '5b43e87c5b204b14b142ebb2027a6619');
INSERT INTO `goods_foods` VALUES ('3cdfe18ca97f4fbfaa8ed27bde08436e', 'af758a4e19e4422c99688103c8f21db6', '8015a629e68f4c5084f4b5fc8397d433');
INSERT INTO `goods_foods` VALUES ('3f445590ba9745058b55fde807154f1f', '110fb0d583bf45e0a6c541c729c50688', '9105a85948ea40449df0eba84eb55976');
INSERT INTO `goods_foods` VALUES ('45305b23db034aa882992963bca15b4b', '862574c9947a44449a29c668d503ff5a', 'aabbe3a29d4846e48d25fc710845afb6');
INSERT INTO `goods_foods` VALUES ('4d813bce05c14b7fada484367bdf6e48', '81bba2db37184e30b4152e88f18a40ce', 'd0e741c2b5c042678e1b21c7bbb7d232');
INSERT INTO `goods_foods` VALUES ('514a26461158453983218157806ac748', 'f8f09d924a9c4d2db3b6b1b8970aaa7d', '5c125abcc3aa482d8d69985a12484dbf');
INSERT INTO `goods_foods` VALUES ('5344e4012d3846198dbcef5f977d9962', 'e95c93f65d6e4ae18f5e3c32694994cc', '8015a629e68f4c5084f4b5fc8397d433');
INSERT INTO `goods_foods` VALUES ('53d88a5348234e4fab5e19af44f01a36', 'bb9fbaa52a664647b1e9e06efff7f8a9', '0bf4ce8829064d4d88620f94aaef0ad5');
INSERT INTO `goods_foods` VALUES ('56bdc9aa7acf4af084f6ecd3815d5c7b', 'f8f09d924a9c4d2db3b6b1b8970aaa7d', '9452a0ff7863468d80a37e97a67cf7c4');
INSERT INTO `goods_foods` VALUES ('584088801d4543b396afc3a4b662385f', '3001014de4ac4fa99489874e3da5cd59', '0bbdb5dfa09543aa86b9a8b3f00d677d');
INSERT INTO `goods_foods` VALUES ('5f8ae71d936c41a681499d8f8dcf54fb', '94bc712693624b3c8de36286dca90009', '2a3ad4c012ec4d3380b5e49ba286401f');
INSERT INTO `goods_foods` VALUES ('62382a0039244963ad6512665384e650', '3001014de4ac4fa99489874e3da5cd59', 'afc70a7a74c44b7cacfa30738cb9197b');
INSERT INTO `goods_foods` VALUES ('63b0c728e3154c18866db3aa4222a966', 'af758a4e19e4422c99688103c8f21db6', '93efb4c9c8f2474f844eb716abbe9b61');
INSERT INTO `goods_foods` VALUES ('63bed1f8144e480d9ddad9125fe07a81', 'bada938f65594ea985ac47e6b3ea360c', 'bcd06e04c0fd48c395eaff4ae7a6b986');
INSERT INTO `goods_foods` VALUES ('664949e05d0041ffa826cf2729444934', 'e95c93f65d6e4ae18f5e3c32694994cc', '259325d8346349c5b01e61cb18e4aca4');
INSERT INTO `goods_foods` VALUES ('6978e3fe0b344c1b8741d2637d7cd6d5', 'd18e7ccd704147e8b3a42e3a0f37c5b0', '8aef76f01f83482aa8b6d2d0c8407928');
INSERT INTO `goods_foods` VALUES ('69e30955767b401486e0e922e42734b6', '110fb0d583bf45e0a6c541c729c50688', 'e27c964b55ba4085a0f5e941c3102f41');
INSERT INTO `goods_foods` VALUES ('69f6f607fb644fef805832a88e7ccde8', '94bc712693624b3c8de36286dca90009', '4fb05974cfba4b9789a636396008cb10');
INSERT INTO `goods_foods` VALUES ('6b915b636b894c0e8d8aaa4ba1222bdf', '3001014de4ac4fa99489874e3da5cd59', 'dd0b6ce64f814de8bb4b455f55f94283');
INSERT INTO `goods_foods` VALUES ('6e2ebd03baa64b438e13522da341d040', '7c33b021591644e587681bcf0ea767c6', 'ab5bcb8b9ba84e40bc8f54c4020641b6');
INSERT INTO `goods_foods` VALUES ('6e7fe6eece814d3086585db8e0dfa088', '862574c9947a44449a29c668d503ff5a', 'a8a7d907bc274c2280be7931558b82d4');
INSERT INTO `goods_foods` VALUES ('70baf49bdf6e4bed9e9e5075c70fac33', 'e95c93f65d6e4ae18f5e3c32694994cc', '3dad23e1383948a78d3905b8e68e9afe');
INSERT INTO `goods_foods` VALUES ('73502e50ca294fed88b75f556f2f64fa', '8bca3f2412774673af9de7a34a485439', '5c26457e032a44d7aa251aa42e18fb2a');
INSERT INTO `goods_foods` VALUES ('7d27dca1711a4be58fcc2f3cc7eba08d', '110fb0d583bf45e0a6c541c729c50688', '2b4fe159560741d0b7270f81fbfdae09');
INSERT INTO `goods_foods` VALUES ('7ef165a10b804458832ceab8b8131fa4', '73be2e7337634eb1993c710cc76c63ba', '1a42af40707b42778192f6c8b1067ff4');
INSERT INTO `goods_foods` VALUES ('808738aac4df4ec885dc8cc37f3738f4', '862574c9947a44449a29c668d503ff5a', '39f2bfb4a5ab446eaf20f6f36487566c');
INSERT INTO `goods_foods` VALUES ('8577f4c8a64c44acab66a515339fd9a9', 'e95c93f65d6e4ae18f5e3c32694994cc', '660ffd75b0394b9a8a51a0c46f174fa5');
INSERT INTO `goods_foods` VALUES ('85c450b7043442dfb142b69ca2e5cacf', 'bada938f65594ea985ac47e6b3ea360c', '39650f252294433a8d3cb5d89e8164c6');
INSERT INTO `goods_foods` VALUES ('87c57219eb90424797bc755d8ec2e562', 'e227f8f1a9054d94a0c71336fe525383', '3efae74c806a49d0860186a16448ed17');
INSERT INTO `goods_foods` VALUES ('8af7f42341774d059d03695fb718d819', '84d42445c1cb4e1286eb93677ca45673', '8bccca1f8f0843a5a03db08b3aaf1620');
INSERT INTO `goods_foods` VALUES ('8ea8c550bb2c440ebaff614fd44f4651', 'af758a4e19e4422c99688103c8f21db6', '5b43e87c5b204b14b142ebb2027a6619');
INSERT INTO `goods_foods` VALUES ('9351a71d76084646804a33baca6047fa', '94bc712693624b3c8de36286dca90009', 'a436e57a5021493dba7821d9f0b15dcb');
INSERT INTO `goods_foods` VALUES ('94f8463f4fc44c6aa9b81cb7eb77c197', 'd7f43337f8774cf29cbb7f40dd3bf917', '7e2b30fd8059474db7aa02d01c4179e0');
INSERT INTO `goods_foods` VALUES ('9627f8fa5a724a998789c902cc0ff37a', '110fb0d583bf45e0a6c541c729c50688', '43e498b087644ae990a78ad6f4b7e40f');
INSERT INTO `goods_foods` VALUES ('96b5762202234f489f1361090551df1b', '940292f979844418b71814a772729a80', '3dad23e1383948a78d3905b8e68e9afe');
INSERT INTO `goods_foods` VALUES ('976bee7fe453412080e2092b1601e686', 'f8f09d924a9c4d2db3b6b1b8970aaa7d', '514482c5c95947c89214ff5947b762d0');
INSERT INTO `goods_foods` VALUES ('9b79660dee11410a8b2c47f0720e6330', '15b2ee2878b4410a9b00951e53cfccc6', '2b94e77a74c944499e64d3a85222c409');
INSERT INTO `goods_foods` VALUES ('9d8746f2b44f4655861245ab74db7866', 'e95c93f65d6e4ae18f5e3c32694994cc', '7cbfba5e35124370845cdb6c141c9f9f');
INSERT INTO `goods_foods` VALUES ('a0bb75f3c492451a883b606e549ae868', '7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', '6bf59dcb076d4dcf865889104c054383');
INSERT INTO `goods_foods` VALUES ('a1494b78354b4e549f8ab2e0fbaa47cc', 'af758a4e19e4422c99688103c8f21db6', '660ffd75b0394b9a8a51a0c46f174fa5');
INSERT INTO `goods_foods` VALUES ('aa3fb31add624a3d932fab48b9b9807e', '1542dff90db24fa0a4faafb16b7e3db6', '416669a98a5941f381b2dd40635b95ef');
INSERT INTO `goods_foods` VALUES ('aceb771084c248f181b966c9fa7cec6a', '3001014de4ac4fa99489874e3da5cd59', '9070a795b38347e99cbad792ec3e7c2c');
INSERT INTO `goods_foods` VALUES ('af51a68f7f7140cd92143342ac695964', '7c33b021591644e587681bcf0ea767c6', '3cef311c7d4d4bd083bf44078fb54e3b');
INSERT INTO `goods_foods` VALUES ('b31beac1068f45238774ad89cf547176', 'bada938f65594ea985ac47e6b3ea360c', 'c21cb3418c2a46118db5f1bb989d3eaa');
INSERT INTO `goods_foods` VALUES ('b71cc1d7b6f845e4833f45fa99095939', '0a55f327d12f4d51903de08eca71c188', 'b1a920182fb343ea8ff55cfbebba819b');
INSERT INTO `goods_foods` VALUES ('ba49d87c4e3e4c0c8ce4af74664c43c4', '3001014de4ac4fa99489874e3da5cd59', '183e73bcea1945669c8eb14a479bb083');
INSERT INTO `goods_foods` VALUES ('c4bbd35678844810a9bf771aa7525002', '7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', '6f26d1d3b1da49e99237bf4c51a2fe2e');
INSERT INTO `goods_foods` VALUES ('c8ff224e73134cb98ea5eb3b22b2ddaf', '73be2e7337634eb1993c710cc76c63ba', 'dbfaa1362e06485b869289804fdeb509');
INSERT INTO `goods_foods` VALUES ('c94257273c5946a3a4713d7e086abbce', '8bca3f2412774673af9de7a34a485439', '43c5966f00b34f73bd028cf595ef0577');
INSERT INTO `goods_foods` VALUES ('d03db508345a49c08217b50628810607', '0a55f327d12f4d51903de08eca71c188', 'ff006151fd5d42e780a316b7c3ff9be9');
INSERT INTO `goods_foods` VALUES ('d40552556ebc466d8690abcad7d7b27b', 'bb9fbaa52a664647b1e9e06efff7f8a9', 'd1ee9afddaa24ae08b358fae25b5dd68');
INSERT INTO `goods_foods` VALUES ('d7c0a7078a1943f38a7637beb40104d8', 'd7f43337f8774cf29cbb7f40dd3bf917', '3efae74c806a49d0860186a16448ed17');
INSERT INTO `goods_foods` VALUES ('ddd708a5c41a4e8b9fd6cb9c59e384dd', 'd7f43337f8774cf29cbb7f40dd3bf917', '1bd29d373cc14e9e8d1a83cb51c0e734');
INSERT INTO `goods_foods` VALUES ('e084cde4ae7a473b9289579e6aa39676', 'e95c93f65d6e4ae18f5e3c32694994cc', '1d9867e1e4b1448c9d513a26d3e67a51');
INSERT INTO `goods_foods` VALUES ('e0c1737e3c7b4cddaef6e17da33d4706', '0a55f327d12f4d51903de08eca71c188', '13e54f9a9d9b44558a49f0048b559d02');
INSERT INTO `goods_foods` VALUES ('e2cb9bd937614e7aaf6ad717478d9150', '1542dff90db24fa0a4faafb16b7e3db6', 'bbcc4deecbc646c4b85a5e4939d27aed');
INSERT INTO `goods_foods` VALUES ('ef2ba9b88cab49adaec74a335394684a', 'bada938f65594ea985ac47e6b3ea360c', '549dd49d221f4eb893d09de1e95447d0');
INSERT INTO `goods_foods` VALUES ('ef59e4d3c7be4d588b9f7aaf5ef76c5b', 'fd2acf050439441cadeb0fab2f2808f3', 'a94b4f7a67954edebf2f42e02525301d');
INSERT INTO `goods_foods` VALUES ('f49884b850be48db9b3d698743270ae0', 'bb9fbaa52a664647b1e9e06efff7f8a9', '17645d66200b4f3f906a263922bcbab6');
INSERT INTO `goods_foods` VALUES ('f65609795f33448ca0cd09a6dccec528', '1542dff90db24fa0a4faafb16b7e3db6', 'd961cef46f2048dd8c4706e1f890abd7');
INSERT INTO `goods_foods` VALUES ('ff95c5275b2a4cf68c011403a6f4e4cd', 'e95c93f65d6e4ae18f5e3c32694994cc', '87e9163f47794e188de83e755c20b896');

-- ----------------------------
-- Table structure for sellers
-- ----------------------------
DROP TABLE IF EXISTS `sellers`;
CREATE TABLE `sellers` (
  `id` varchar(32) CHARACTER SET ascii NOT NULL COMMENT '标识符',
  `name` varchar(128) DEFAULT NULL COMMENT '商家名称',
  `sellertype` tinyint(2) DEFAULT NULL COMMENT '商家类型',
  `description` varchar(64) DEFAULT NULL COMMENT '描述',
  `deliverytime` int(8) DEFAULT NULL COMMENT '配送时间',
  `score` decimal(2,1) DEFAULT NULL COMMENT '评分',
  `servicescore` decimal(2,1) DEFAULT NULL COMMENT '服务分',
  `foodscore` decimal(2,1) DEFAULT NULL COMMENT '食物分',
  `rankrate` decimal(4,1) DEFAULT NULL COMMENT '排名分',
  `minprice` int(6) DEFAULT NULL COMMENT '起送价',
  `deliveryprice` decimal(4,2) DEFAULT NULL COMMENT '配送费',
  `ratingcount` int(16) DEFAULT NULL COMMENT '评论数',
  `sellcount` int(16) DEFAULT NULL COMMENT '销售量',
  `bulletin` varchar(1024) DEFAULT NULL COMMENT '公共',
  `avatar` varchar(512) DEFAULT NULL COMMENT '头像',
  `infos` varchar(1024) DEFAULT NULL COMMENT '信息',
  `pics` varchar(1024) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
-- Records of sellers
-- ----------------------------
INSERT INTO `sellers` VALUES ('16a6ffaa1638479e8e3dd0b33d04d91c', '原味汤粉王', '2', '商家配送', '36', '4.0', '4.2', '4.1', '67.3', '20', '5.00', '60', '112', '原味汤粉王（九祥岭店）', 'https://fuss10.elemecdn.com/c/2e/3d54f32ff5fee8e5cc7e0dcc364bfpng.png', '该商家支持发票,请下单写好发票抬头；品类:盖浇饭，汤粉面;深圳市南山区西丽街道南田路九祥岭村东区130栋102号;营业时间:10:30-20:00', 'https://fuss10.elemecdn.com/c/2e/3d54f32ff5fee8e5cc7e0dcc364bfpng.png;https://fuss10.elemecdn.com/1/1a/d389bc13c3275aed18aa7b3ffdb22jpeg.jpeg;https://fuss10.elemecdn.com/8/46/ae2b47de05a24befe4cf370812208jpeg.jpeg');
INSERT INTO `sellers` VALUES ('54d55947c0ce4519800a81cd888ca2e3', '饭戒（西丽店）', '1', '蜂鸟专送', '42', '4.4', '4.3', '4.5', '68.2', '0', '2.00', '12', '168', '饭戒——一个神奇的互联网外卖！单点饮料甜品我们不配送哦深圳职业技术学院东校区、西校区、北校区的亲们请注意，感谢亲选择我们家的餐，由于配送员无法进入亲们的学校送餐，无法配送至你们楼下，如您订我们家的餐请与配送员联系您最合适的位置取餐，一旦配送员接单后，本店将无法退款，谢谢您的合作。', 'https://fuss10.elemecdn.com/2/f0/5a44c18d902beef8f10a142802cb0png.png', '该商家支持发票,请下单写好发票抬头;品类:简餐，盖浇饭;深圳市南山区西丽街道文苑路丽苑二村一栋116号商铺;营业时间:10:00-21:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('64f4e37654fb4f2b8825830939402c81', '艾克力休闲餐厅', '1', '商家配送', '39', '3.5', '3.5', '3.5', '42.3', '16', '2.00', '3', '128', '联系电话：13652357207 394694', 'https://fuss10.elemecdn.com/3/1d/fa3051a7dc657e8162d2a62f90e96png.png', '品类:简餐，盖浇饭;深圳市南山区西丽办事处新围旺棠工业区22栋一层36号;营业时间:10:20-21:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('6838ff2d9acc45d38e2558ac6fb39f1d', '流星花园（后海店', '6', '商家配送', '48', '4.9', '4.9', '4.9', '88.5', '48', '20.00', '88', '154', '那一天，我们邂逅了浪漫、收获了爱情，让我们重温流星花园般的永恒记忆；岁月渐长，唯真情与爱意愈久弥香。', 'https://fuss10.elemecdn.com/f/72/7f91b47d8ba1e72f4f7da5bc3f748jpeg.jpeg', '\r\n\r\n\r\n该商家支持发票,请下单写好发票抬头;品类:鲜花;深圳市南山区粤海街道登良路124号102C;营业时间:10:00-22:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('9aabbdc632a6448cad6d41c20a4a0a5c', '明记甜品', '5', '蜂鸟专送', '44', '4.3', '3.5', '5.0', '58.6', '20', '3.00', '12', '37', '明记甜品', 'https://fuss10.elemecdn.com/3/81/3210bcdaa2dd3712e94d466fb6a08jpeg.jpeg', '该商家支持发票,请下单写好发票抬头;品类:甜品;深圳市南山区桃源街道平山村66栋104号商铺;营业时间:10:30-22:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('9b603743615c4721841c843ea4381bc6', '粥品香坊', '2', '蜂鸟专送', '38', '4.2', '4.1', '4.3', '69.2', '20', '4.00', '24', '90', '粥品香坊其烹饪粥料的秘方源于中国千年古法，在融和现代制作工艺，由世界烹饪大师屈浩先生领衔研发。坚守纯天然、0添加的良心品质深得消费者青睐，发展至今成为粥类的引领品牌。是2008年奥运会和2013年园博会指定餐饮服务商。', 'http://static.galileo.xiaojukeji.com/static/tms/seller_avatar_256px.jpg', '该商家支持发票,请下单写好发票抬头;品类:其他菜系,包子粥店;北京市昌平区回龙观西大街龙观置业大厦底商B座102单元1340;营业时间:10:00-20:30', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('bad61a4a4c7f464d8b5ac0c4d9a5739b', '奶盖贡茶（留仙洞店）', '5', '蜂鸟专送', '32', '4.6', '4.3', '5.0', '69.1', '20', '5.00', '15', '61', '奶盖贡茶（留仙洞店）', 'https://fuss10.elemecdn.com/f/91/fdd3950f5366241c4489b670ec767png.png', '品类:奶茶果汁;深圳市南山区西丽街道留仙大道2188号天悦湾花园粤方广场一楼层L103号;营业时间:10:30-22:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('e07a809eac404d4daa3e6fadf91a2fa4', '美滋岛寿司', '3', '蜂鸟专送', '42', '3.6', '3.6', '3.5', '41.2', '20', '5.00', '30', '107', '美滋岛寿司是由两位年轻的小伙创立而成，邀请了多名海内外经验丰富的料理师傅倾情加入，并一再推出了诸多系列，适合国人口味、时尚多样的寿司。美滋岛寿司主打新派美式寿司，结合了对产品的高要求和细致周到的服务，俨然突破了概念上的传统和正统，承诺将美味，潮流，快乐，传递给每一位。美滋岛寿司', 'https://fuss10.elemecdn.com/4/01/ff18ea1003631377d0b87926d8fbapng.png', '\r\n该商家支持发票,请下单写好发票抬头;品类:日韩料理;深圳市南山区西丽街道留仙大道南国丽城2栋3号铺;营业时间:11:35-21:25', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('e1aed97a05db456a837561e7656655a8', '必胜客（西丽店）', '4', '蜂鸟专送', '46', '4.6', '4.3', '5.0', '68.4', '20', '5.00', '29', '481', '必胜客（西丽店）', 'https://fuss10.elemecdn.com/b/86/01f4620140dd82cf9ab70c0deb38fjpeg.jpeg', '\r\n该商家支持发票,请下单写好发票抬头;品类:披萨意面，西餐;深圳市南山区留仙大道路南国丽城花园1栋101一层;营业时间:10:30-22:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('e6055dac0bab4757b1adf083baf91333', '状元三及第', '2', '商家配送', '42', '4.7', '4.4', '5.0', '70.0', '16', '2.00', '30', '707', '饭点较忙，电话常占线。请确保您的电话号码正确及电话畅通，以便送餐员能及时联系上您。为了能及时用餐，希望大家提前1小时以上预定，避开高峰拥堵', 'https://fuss10.elemecdn.com/e/3a/60e19c912e7f5e063508295ed7077jpeg.jpeg', '该商家支持发票,请下单写好发票抬头;品类:简餐，三及第;深圳市南山区西丽街道旺棠工业区22栋24号铺;营业时间:09:30-21:55', 'https://fuss10.elemecdn.com/8/46/ae2b47de05a24befe4cf370812208jpeg.jpeg;https://fuss10.elemecdn.com/d/1c/839a949d72464d45d1078565ef6c9jpeg.jpeg;https://fuss10.elemecdn.com/8/46/ae2b47de05a24befe4cf370812208jpeg.jpeg');
INSERT INTO `sellers` VALUES ('eca920c7233f484da8f14fe3a95ed200', '爱尔cake蛋糕店', '6', '商家配送', '93', '4.2', '4.1', '4.3', '56.8', '0', '0.00', '20', '324', '爱尔cake，做给爱人吃的蛋糕！致力于为深圳人们提供专业的、高品质的、方便快捷的生日蛋糕配送服务。始终坚持以天然、健康、放心的食品原则，用做给爱人吃的态度，做好每一个蛋糕。专业做配送，深圳全城(含所有原关外区域)专人直送到家，最快1小时送达。服务至晚上12点喔！', 'https://fuss10.elemecdn.com/0/3a/bce85958f282aaf23bd670589833djpeg.jpeg', '\r\n该商家支持发票,请下单写好发票抬头;品类:蛋糕;深圳市福田区梅林街道黄祠巷79号梅安居102铺;营业时间:07:00-24:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('f3f45df2ed1b4f01859737d422c94b92', '世富茶餐厅（西丽店）', '1', '蜂鸟专送', '39', '4.2', '4.3', '4.4', '67.1', '20', '5.00', '49', '733', '註：1：焗飯、煲仔飯、蒸类系列即點即做，需時35分鐘，請耐心等候！↵       2：小炒系列不配送白飯！', 'https://fuss10.elemecdn.com/7/76/a1b563a81fbbac8d2dcc99bc1f173jpeg.jpeg', '该商家支持发票,请下单写好发票抬头;品类:简餐，粤菜;深圳市南山区西丽街道新围石岭工业区1栋首层11-12-13-14号;营业时间:10:00-23:20', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');
INSERT INTO `sellers` VALUES ('f8f447e1ec6442748b46c1724e0f2e0d', '悠来顺韩国简餐', '3', '商家配送', '30', '4.8', '4.4', '5.0', '70.2', '0', '3.00', '30', '123', '本店所有料理材料均由韩国进口，更严格的要求，只为做出最正宗的韩式料理', 'https://fuss10.elemecdn.com/7/6d/1dbcf8a839c6bbaee328fd78320c6png.png', '该商家支持发票,请下单写好发票抬头;品类:日韩料理;深圳市南山区西丽街道西丽新维村学生公寓26栋北楼壹楼7号商铺;营业时间:10:20-21:00', 'http://fuss10.elemecdn.com/8/71/c5cf5715740998d5040dda6e66abfjpeg.jpeg;http://fuss10.elemecdn.com/b/6c/75bd250e5ba69868f3b1178afbda3jpeg.jpeg;http://fuss10.elemecdn.com/f/96/3d608c5811bc2d902fc9ab9a5baa7jpeg.jpeg;http://fuss10.elemecdn.com/6/ad/779f8620ff49f701cd4c58f6448b6jpeg.jpeg');

-- ----------------------------
-- Table structure for seller_foods
-- ----------------------------
DROP TABLE IF EXISTS `seller_foods`;
CREATE TABLE `seller_foods` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `price` decimal(6,2) DEFAULT NULL COMMENT '价格',
  `oldprice` decimal(6,2) DEFAULT NULL COMMENT '原价格',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `sellcount` int(8) DEFAULT NULL COMMENT '销售数',
  `rating` int(8) DEFAULT NULL COMMENT '评论数',
  `info` varchar(1024) DEFAULT NULL COMMENT '简介',
  `icon` varchar(1024) DEFAULT NULL COMMENT '缩略图',
  `image` varchar(1024) DEFAULT NULL COMMENT '详情图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller_foods
-- ----------------------------
INSERT INTO `seller_foods` VALUES ('0a846d0d714946f887523fbacc082f48', '红豆薏米粥套餐', '37.00', null, '红豆薏米粥,三鲜干蒸烧卖,拍黄瓜', '3', '1', null, 'http://fuss10.elemecdn.com/f/49/27f26ed00c025b2200a9ccbb7e67ejpeg.jpeg', 'http://fuss10.elemecdn.com/f/49/27f26ed00c025b2200a9ccbb7e67ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('0bbdb5dfa09543aa86b9a8b3f00d677d', '珍珠抹茶奶盖茶/红/绿/乌', '19.00', null, null, '4', '5', null, 'https://fuss10.elemecdn.com/6/0a/f9c01b9822753313e609d56a6269fjpeg.jpeg', 'https://fuss10.elemecdn.com/6/0a/f9c01b9822753313e609d56a6269fjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('0bf4ce8829064d4d88620f94aaef0ad5', '泡菜炒年糕', '25.00', null, null, '2', '1', null, 'https://fuss10.elemecdn.com/2/4f/3fc82f8769d9a983464e951a5788djpeg.jpeg', 'https://fuss10.elemecdn.com/2/4f/3fc82f8769d9a983464e951a5788djpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('13e54f9a9d9b44558a49f0048b559d02', '手撕包菜', '16.00', null, null, '29', '11', null, 'http://fuss10.elemecdn.com/9/c6/f3bc84468820121112e79583c24efjpeg.jpeg', 'http://fuss10.elemecdn.com/9/c6/f3bc84468820121112e79583c24efjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('145f123963c64cc3820069e49e13e0e4', '红枣山药粥套餐', '29.00', '36.00', '红枣山药糙米粥,素材包,爽口莴笋丝,四川泡菜或八宝酱菜,配菜可备注', '17', '4', null, 'http://fuss10.elemecdn.com/6/72/cb844f0bb60c502c6d5c05e0bddf5jpeg.jpeg', 'http://fuss10.elemecdn.com/6/72/cb844f0bb60c502c6d5c05e0bddf5jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('17645d66200b4f3f906a263922bcbab6', '辣炒年糕', '22.00', null, null, '2', '0', null, 'https://fuss10.elemecdn.com/8/15/02190bbd4bf80e31df78e94382a77jpeg.jpeg', 'https://fuss10.elemecdn.com/8/15/02190bbd4bf80e31df78e94382a77jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('183e73bcea1945669c8eb14a479bb083', '奶盖格雷', '19.00', null, null, '7', '3', null, 'https://fuss10.elemecdn.com/1/fe/764c79e1b08c4be7fda762b5fb490jpeg.jpeg', 'https://fuss10.elemecdn.com/1/fe/764c79e1b08c4be7fda762b5fb490jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('1a42af40707b42778192f6c8b1067ff4', '黑糖银耳桔露', '19.00', null, null, '0', '0', null, 'https://fuss10.elemecdn.com/f/e1/d0bd3fe073cc9530e925ba37c7b27jpeg.jpeg', 'https://fuss10.elemecdn.com/f/e1/d0bd3fe073cc9530e925ba37c7b27jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('1bd29d373cc14e9e8d1a83cb51c0e734', '蜜瓜圣女萝莉杯', '6.00', null, null, '1', '1', null, 'http://fuss10.elemecdn.com/b/5f/b3b04c259d5ec9fa52e1856ee50dajpeg.jpeg', 'http://fuss10.elemecdn.com/b/5f/b3b04c259d5ec9fa52e1856ee50dajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('1d9867e1e4b1448c9d513a26d3e67a51', '红枣山药糙米粥', '10.00', null, null, '81', '50', null, 'http://fuss10.elemecdn.com/9/b5/469d8854f9a3a03797933fd01398bjpeg.jpeg', 'http://fuss10.elemecdn.com/9/b5/469d8854f9a3a03797933fd01398bjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('259325d8346349c5b01e61cb18e4aca4', '糊塌子', '10.00', null, null, '80', '60', null, 'http://fuss10.elemecdn.com/0/05/097a2a59fd2a2292d08067e16380cjpeg.jpeg', 'http://fuss10.elemecdn.com/0/05/097a2a59fd2a2292d08067e16380cjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('2a3ad4c012ec4d3380b5e49ba286401f', '隆江猪脚饭', '13.00', null, null, '5', '1', null, 'https://fuss10.elemecdn.com/4/aa/216aa524e58cbe33bf19603c75d2djpeg.jpeg', 'https://fuss10.elemecdn.com/4/aa/216aa524e58cbe33bf19603c75d2djpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('2b4fe159560741d0b7270f81fbfdae09', '枸杞叶牛肉丸汤', '12.00', null, null, '4', '2', null, 'https://fuss10.elemecdn.com/b/56/425f1a230ef9d15197b0d2f917eccjpeg.jpeg', 'https://fuss10.elemecdn.com/b/56/425f1a230ef9d15197b0d2f917eccjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('2b94e77a74c944499e64d3a85222c409', '桔梗', '25.00', null, null, '0', '0', null, 'https://fuss10.elemecdn.com/a/63/f721daee19f86b4e2a4673024418ejpeg.jpeg', 'https://fuss10.elemecdn.com/a/63/f721daee19f86b4e2a4673024418ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('36e4ffe99fd74081a9cd50243897887e', '瘦肉汤', '8.00', null, null, '8', '6', null, 'https://fuss10.elemecdn.com/b/22/bf9f4fe71fffcf0012be4aeba477ejpeg.jpeg', 'https://fuss10.elemecdn.com/b/22/bf9f4fe71fffcf0012be4aeba477ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('37554482fe014b1b9bccb391edfb2370', '红豆薏米美肤粥', '12.00', null, '甜粥', '86', '50', null, 'http://fuss10.elemecdn.com/d/22/260bd78ee6ac6051136c5447fe307jpeg.jpeg', 'http://fuss10.elemecdn.com/d/22/260bd78ee6ac6051136c5447fe307jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('390a1c969cd84bb78a2acbc1e842313f', '盐焗鸡饭', '13.00', null, null, '8', '4', null, 'https://fuss10.elemecdn.com/1/50/55185b0b4edf4d30d59babf2ac226jpeg.jpeg', 'https://fuss10.elemecdn.com/1/50/55185b0b4edf4d30d59babf2ac226jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('39650f252294433a8d3cb5d89e8164c6', '叉烧饭+猪肉丸汤', '25.00', null, null, '25', '15', null, 'https://fuss10.elemecdn.com/9/cb/42ec37b9af2d1a88229c1b05dc56ejpeg.jpeg', 'https://fuss10.elemecdn.com/9/cb/42ec37b9af2d1a88229c1b05dc56ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('39f2bfb4a5ab446eaf20f6f36487566c', '蓝莓水果茶', '18.00', null, null, '3', '0', null, 'https://fuss10.elemecdn.com/e/b6/f842310861d835592b3eb64ba9788jpeg.jpeg', 'https://fuss10.elemecdn.com/e/b6/f842310861d835592b3eb64ba9788jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('3cef311c7d4d4bd083bf44078fb54e3b', '伦敦1830', '20.00', null, null, '0', '0', null, 'https://fuss10.elemecdn.com/5/3f/5937d1c95844a8580adc0d4b84572jpeg.jpeg', 'https://fuss10.elemecdn.com/5/3f/5937d1c95844a8580adc0d4b84572jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('3dad23e1383948a78d3905b8e68e9afe', '八宝酱菜', '4.00', null, null, '84', '50', null, 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png', 'http://static.galileo.xiaojukeji.com/static/tms/default_header.png');
INSERT INTO `seller_foods` VALUES ('3efae74c806a49d0860186a16448ed17', 'VC无限橙果汁', '8.00', '10.00', null, '15', '1', null, 'http://fuss10.elemecdn.com/e/c6/f348e811772016ae24e968238bcbfjpeg.jpeg', 'http://fuss10.elemecdn.com/e/c6/f348e811772016ae24e968238bcbfjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('416669a98a5941f381b2dd40635b95ef', '泡菜炒饭', '18.00', null, null, '5', '3', null, 'https://fuss10.elemecdn.com/e/c0/b3d32f5e74358fdf015fd2936f51fjpeg.jpeg', 'https://fuss10.elemecdn.com/e/c0/b3d32f5e74358fdf015fd2936f51fjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('43c5966f00b34f73bd028cf595ef0577', '韩式炸酱面', '22.00', null, null, '3', '0', null, 'https://fuss10.elemecdn.com/c/91/238ccff49050c5580a6854d253e34jpeg.jpeg', 'https://fuss10.elemecdn.com/c/91/238ccff49050c5580a6854d253e34jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('43e498b087644ae990a78ad6f4b7e40f', '枸杞叶猪肉丸汤', '12.00', null, null, '7', '1', null, 'https://fuss10.elemecdn.com/5/06/49c704c48a1eb6e579daf18ab7197jpeg.jpeg', 'https://fuss10.elemecdn.com/5/06/49c704c48a1eb6e579daf18ab7197jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('4fb05974cfba4b9789a636396008cb10', '猪脚叉烧饭', '15.00', null, null, '35', '12', null, 'https://fuss10.elemecdn.com/5/69/1aed346e6755ec30beb21db8721c3jpeg.jpeg', 'https://fuss10.elemecdn.com/5/69/1aed346e6755ec30beb21db8721c3jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('514482c5c95947c89214ff5947b762d0', '猪杂汤珍珠粉', '10.00', null, null, '36', '4', null, 'https://fuss10.elemecdn.com/1/e3/637bb58ab914f49525f7be432b56cjpeg.jpeg', 'https://fuss10.elemecdn.com/1/e3/637bb58ab914f49525f7be432b56cjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('549dd49d221f4eb893d09de1e95447d0', '猪脚粉肠+猪肉丸汤', '25.00', null, null, '35', '5', null, 'https://fuss10.elemecdn.com/1/26/8edc2d1835ebbbb248ed38a3b7f60jpeg.jpeg', 'https://fuss10.elemecdn.com/1/26/8edc2d1835ebbbb248ed38a3b7f60jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('59f521aa83084b688d073a7cdf125ae4', '寒天奇异果冰茶', '21.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/5/90/b6d1625ce4a0ebec855af65d2fc59jpeg.jpeg', 'https://fuss10.elemecdn.com/5/90/b6d1625ce4a0ebec855af65d2fc59jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('5b43e87c5b204b14b142ebb2027a6619', '扁豆焖面', '14.00', null, null, '188', '96', null, 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg', 'http://fuss10.elemecdn.com/c/6b/29e3d29b0db63d36f7c500bca31d8jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('5c125abcc3aa482d8d69985a12484dbf', '猪杂汤河粉', '10.00', null, null, '25', '12', null, 'https://fuss10.elemecdn.com/4/02/c8bccd3a7468e215a6313cfda9a6ajpeg.jpeg', 'https://fuss10.elemecdn.com/4/02/c8bccd3a7468e215a6313cfda9a6ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('5c26457e032a44d7aa251aa42e18fb2a', '韩式拌冷面', '18.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/e/af/22c972da4bd638b79cba6c69027c1jpeg.jpeg', 'https://fuss10.elemecdn.com/e/af/22c972da4bd638b79cba6c69027c1jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('660ffd75b0394b9a8a51a0c46f174fa5', '招牌猪肉白菜锅贴/10个', '17.00', null, null, '101', '78', null, 'http://fuss10.elemecdn.com/7/72/9a580c1462ca1e4d3c07e112bc035jpeg.jpeg', 'http://fuss10.elemecdn.com/7/72/9a580c1462ca1e4d3c07e112bc035jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('665e1c52b93c4a27a9828eed3cbdfc5a', '珍珠奶茶', '15.00', null, null, '3', '0', null, 'https://fuss10.elemecdn.com/e/a0/023efc9335d64427451ebc967560bjpeg.jpeg', 'https://fuss10.elemecdn.com/e/a0/023efc9335d64427451ebc967560bjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('6bf59dcb076d4dcf865889104c054383', '相思豆奶茶', '16.00', null, null, '2', '0', '', 'https://fuss10.elemecdn.com/e/2b/fd3ae2f721b8d26820e1119dfc9d4jpeg.jpeg', 'https://fuss10.elemecdn.com/e/2b/fd3ae2f721b8d26820e1119dfc9d4jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('6f26d1d3b1da49e99237bf4c51a2fe2e', '寒天奶茶', '17.00', null, null, '3', '1', null, 'https://fuss10.elemecdn.com/1/1f/812ac80d877d2969822cf33b038e5jpeg.jpeg', 'https://fuss10.elemecdn.com/1/1f/812ac80d877d2969822cf33b038e5jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('7303bb2904b04b0389e3253fadcaf1c0', '金钻奶茶', '17.00', null, null, '12', '0', null, 'https://fuss10.elemecdn.com/a/b7/b5dc875cef9e7dc18d7b73d943e20jpeg.jpeg', 'https://fuss10.elemecdn.com/a/b7/b5dc875cef9e7dc18d7b73d943e20jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('7bc76762d9e94107a9ba41981a2a876f', '寒天爱玉', '16.00', null, null, '2', '0', null, 'https://fuss10.elemecdn.com/d/e2/5cf6776b5e89c29ec6ee712340756jpeg.jpeg', 'https://fuss10.elemecdn.com/d/e2/5cf6776b5e89c29ec6ee712340756jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('7cbfba5e35124370845cdb6c141c9f9f', '红豆薏米美肤粥', '12.00', null, '甜粥', '88', '100', null, 'http://fuss10.elemecdn.com/d/22/260bd78ee6ac6051136c5447fe307jpeg.jpeg', 'http://fuss10.elemecdn.com/d/22/260bd78ee6ac6051136c5447fe307jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('7e2b30fd8059474db7aa02d01c4179e0', '加多宝', '6.00', null, null, '7', '2', null, 'http://fuss10.elemecdn.com/b/9f/5e6c99c593cf65229225c5661bcdejpeg.jpeg', 'http://fuss10.elemecdn.com/b/9f/5e6c99c593cf65229225c5661bcdejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('8015a629e68f4c5084f4b5fc8397d433', '葱花饼', '10.00', null, null, '124', '85', null, 'http://fuss10.elemecdn.com/f/28/a51e7b18751bcdf871648a23fd3b4jpeg.jpeg', 'http://fuss10.elemecdn.com/f/28/a51e7b18751bcdf871648a23fd3b4jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('87e9163f47794e188de83e755c20b896', '南瓜粥', '9.00', null, '甜粥', '91', '100', null, 'http://fuss10.elemecdn.com/8/a6/453f65f16b1391942af11511b7a90jpeg.jpeg', 'http://fuss10.elemecdn.com/8/a6/453f65f16b1391942af11511b7a90jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('8aef76f01f83482aa8b6d2d0c8407928', '紫菜包饭', '12.00', null, null, '2', '0', null, 'https://fuss10.elemecdn.com/3/5d/d9c5d7cbc86ea93bca7b00e931c33jpeg.jpeg', 'https://fuss10.elemecdn.com/3/5d/d9c5d7cbc86ea93bca7b00e931c33jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('8bccca1f8f0843a5a03db08b3aaf1620', '皮蛋瘦肉粥', '10.00', null, '咸粥', '229', '100', null, 'http://fuss10.elemecdn.com/c/cd/c12745ed8a5171e13b427dbc39401jpeg.jpeg', 'http://fuss10.elemecdn.com/c/cd/c12745ed8a5171e13b427dbc39401jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('9070a795b38347e99cbad792ec3e7c2c', '熊猫奶盖茶/红/绿/乌', '21.00', null, null, '6', '0', null, 'https://fuss10.elemecdn.com/c/76/5a9dcdb5a3a431f0a0907b7775790jpeg.jpeg', 'https://fuss10.elemecdn.com/c/76/5a9dcdb5a3a431f0a0907b7775790jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('9105a85948ea40449df0eba84eb55976', '枸杞叶猪肉汤', '10.00', null, null, '5', '1', null, 'https://fuss10.elemecdn.com/b/22/bf9f4fe71fffcf0012be4aeba477ejpeg.jpeg', 'https://fuss10.elemecdn.com/b/22/bf9f4fe71fffcf0012be4aeba477ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('93efb4c9c8f2474f844eb716abbe9b61', '牛肉馅饼', '14.00', null, null, '114', '91', null, 'http://fuss10.elemecdn.com/d/b9/bcab0e8ad97758e65ae5a62b2664ejpeg.jpeg', 'http://fuss10.elemecdn.com/d/b9/bcab0e8ad97758e65ae5a62b2664ejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('9452a0ff7863468d80a37e97a67cf7c4', '牛肉丸汤面', '13.00', null, null, '25', '14', null, 'https://fuss10.elemecdn.com/e/9a/c3c53dae96ea6a8834b6b3bd52e2ajpeg.jpeg', 'https://fuss10.elemecdn.com/e/9a/c3c53dae96ea6a8834b6b3bd52e2ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('a436e57a5021493dba7821d9f0b15dcb', '白切鸡饭', '13.00', null, null, '50', '15', null, 'https://fuss10.elemecdn.com/8/1b/af4c506b80a79203ffead7494a95ajpeg.jpeg', 'https://fuss10.elemecdn.com/8/1b/af4c506b80a79203ffead7494a95ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('a8a7d907bc274c2280be7931558b82d4', '椰绿芒果茶', '18.00', null, null, '0', '0', null, 'https://fuss10.elemecdn.com/1/62/4282759c216ec376a2e86193bc3eejpeg.jpeg', 'https://fuss10.elemecdn.com/1/62/4282759c216ec376a2e86193bc3eejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('a94b4f7a67954edebf2f42e02525301d', '皮蛋瘦肉粥套餐', '31.00', null, null, '12', '5', null, 'http://fuss10.elemecdn.com/8/96/f444a8087f0e940ef264617f9d98ajpeg.jpeg', 'http://fuss10.elemecdn.com/8/96/f444a8087f0e940ef264617f9d98ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('aaa67a7d046c47ea9afaa4daaa3e1b00', '牛肉丸汤粉', '13.00', null, null, '41', '5', null, 'https://fuss10.elemecdn.com/e/9a/c3c53dae96ea6a8834b6b3bd52e2ajpeg.jpeg', 'https://fuss10.elemecdn.com/e/9a/c3c53dae96ea6a8834b6b3bd52e2ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('aabbe3a29d4846e48d25fc710845afb6', '寒天西柚茶', '20.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/2/bd/5a03075fb9fccc60c0eb2d1d32941jpeg.jpeg', 'https://fuss10.elemecdn.com/2/bd/5a03075fb9fccc60c0eb2d1d32941jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('ab5bcb8b9ba84e40bc8f54c4020641b6', '红豆乌龙鲜奶铁', '18.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/1/b7/3c86c7ecd38ca45ffb047dc3a142fjpeg.jpeg', 'https://fuss10.elemecdn.com/1/b7/3c86c7ecd38ca45ffb047dc3a142fjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('afc70a7a74c44b7cacfa30738cb9197b', '奥利奥草莓奶盖', '19.00', null, null, '5', '1', null, 'https://fuss10.elemecdn.com/4/ca/3e8a43eb867e27dfda7a21c09715cjpeg.jpeg', 'https://fuss10.elemecdn.com/4/ca/3e8a43eb867e27dfda7a21c09715cjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('b1a920182fb343ea8ff55cfbebba819b', '香酥黄金鱼/3条', '11.00', null, null, '15', '5', null, 'http://fuss10.elemecdn.com/4/e7/8277a6a2ea0a2e97710290499fc41jpeg.jpeg', 'http://fuss10.elemecdn.com/4/e7/8277a6a2ea0a2e97710290499fc41jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('bbcc4deecbc646c4b85a5e4939d27aed', '什锦石锅拌饭', '18.00', null, null, '6', '0', null, 'https://fuss10.elemecdn.com/c/ec/38299c06e43befc660317d4c2e403jpeg.jpeg', 'https://fuss10.elemecdn.com/c/ec/38299c06e43befc660317d4c2e403jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('bcd06e04c0fd48c395eaff4ae7a6b986', '鸡腿+肉丸汤', '25.00', null, null, '48', '35', null, 'https://fuss10.elemecdn.com/c/94/1dab5ab8680c1cc56808db63875f4jpeg.jpeg', 'https://fuss10.elemecdn.com/c/94/1dab5ab8680c1cc56808db63875f4jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('c21cb3418c2a46118db5f1bb989d3eaa', '捞面牛肉丸汤', '20.00', null, null, '45', '6', null, 'https://fuss10.elemecdn.com/1/bc/d438685930b0f72de74b880f6c9ffjpeg.jpeg', 'https://fuss10.elemecdn.com/1/bc/d438685930b0f72de74b880f6c9ffjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('d0e741c2b5c042678e1b21c7bbb7d232', '香米抹茶红豆', '17.00', null, null, '2', '0', null, 'https://fuss10.elemecdn.com/7/16/45c9caca6173228158d0d8a600fdejpeg.jpeg', 'https://fuss10.elemecdn.com/7/16/45c9caca6173228158d0d8a600fdejpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('d1ee9afddaa24ae08b358fae25b5dd68', '海鲜葱饼', '25.00', null, null, '5', '3', null, 'https://fuss10.elemecdn.com/c/8d/aa6b9298be5547330b503d774a5e3jpeg.jpeg', 'https://fuss10.elemecdn.com/c/8d/aa6b9298be5547330b503d774a5e3jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('d961cef46f2048dd8c4706e1f890abd7', '海鲜大酱汤（配饭）', '25.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/3/00/a48f4bebf227b6095c76341c927dcjpeg.jpeg', 'https://fuss10.elemecdn.com/3/00/a48f4bebf227b6095c76341c927dcjpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('dbfaa1362e06485b869289804fdeb509', '黑糖银耳奶茶', '18.00', null, null, '0', '0', null, 'https://fuss10.elemecdn.com/d/f3/0f7d9fcc34d641960d3557def8986jpeg.jpeg', 'https://fuss10.elemecdn.com/d/f3/0f7d9fcc34d641960d3557def8986jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('dd0b6ce64f814de8bb4b455f55f94283', '蔓越莓榴莲奶盖', '20.00', null, null, '8', '0', null, 'https://fuss10.elemecdn.com/1/cb/496d35afbd90040bf94c799eb3a3ajpeg.jpeg', 'https://fuss10.elemecdn.com/1/cb/496d35afbd90040bf94c799eb3a3ajpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('e27c964b55ba4085a0f5e941c3102f41', '猪肉丸汤', '10.00', null, null, '12', '8', null, 'https://fuss10.elemecdn.com/5/06/49c704c48a1eb6e579daf18ab7197jpeg.jpeg', 'https://fuss10.elemecdn.com/5/06/49c704c48a1eb6e579daf18ab7197jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('e7d79537e7ea4e72835ff9cbce5ae5cc', '格雷三兄弟', '17.00', null, null, '1', '0', null, 'https://fuss10.elemecdn.com/4/2c/62daf6673890bc75e8efc05fd3889jpeg.jpeg', 'https://fuss10.elemecdn.com/4/2c/62daf6673890bc75e8efc05fd3889jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('fc77699522774b328a580baf603751d3', '猪杂捞粉', '10.00', null, null, '36', '12', null, 'https://fuss10.elemecdn.com/d/3f/78fe16e9c5c718e7a110e695b45e9jpeg.jpeg', 'https://fuss10.elemecdn.com/d/3f/78fe16e9c5c718e7a110e695b45e9jpeg.jpeg');
INSERT INTO `seller_foods` VALUES ('ff006151fd5d42e780a316b7c3ff9be9', '娃娃菜炖豆腐', '17.00', null, null, '43', '32', null, 'http://fuss10.elemecdn.com/d/2d/b1eb45b305635d9dd04ddf157165fjpeg.jpeg', 'http://fuss10.elemecdn.com/d/2d/b1eb45b305635d9dd04ddf157165fjpeg.jpeg');

-- ----------------------------
-- Table structure for seller_goods
-- ----------------------------
DROP TABLE IF EXISTS `seller_goods`;
CREATE TABLE `seller_goods` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `seller_id` varchar(32) DEFAULT NULL COMMENT '商家ID',
  `name` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `type` smallint(2) DEFAULT NULL COMMENT '分组类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家产品表';

-- ----------------------------
-- Records of seller_goods
-- ----------------------------
INSERT INTO `seller_goods` VALUES ('', '', null, null);
INSERT INTO `seller_goods` VALUES ('0a55f327d12f4d51903de08eca71c188', '9b603743615c4721841c843ea4381bc6', '精选热菜', '-1');
INSERT INTO `seller_goods` VALUES ('0ce5c4698fe94b6195b0444aae1400e2', '9b603743615c4721841c843ea4381bc6', '单人精彩套餐', '2');
INSERT INTO `seller_goods` VALUES ('110fb0d583bf45e0a6c541c729c50688', '16a6ffaa1638479e8e3dd0b33d04d91c', '汤类', '-1');
INSERT INTO `seller_goods` VALUES ('1542dff90db24fa0a4faafb16b7e3db6', 'f8f447e1ec6442748b46c1724e0f2e0d', '情迷主食系列', '-1');
INSERT INTO `seller_goods` VALUES ('15b2ee2878b4410a9b00951e53cfccc6', 'f8f447e1ec6442748b46c1724e0f2e0d', '拌菜系列', '-1');
INSERT INTO `seller_goods` VALUES ('3001014de4ac4fa99489874e3da5cd59', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '奶盖招牌系列', '-1');
INSERT INTO `seller_goods` VALUES ('73be2e7337634eb1993c710cc76c63ba', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '冬季热饮', '-1');
INSERT INTO `seller_goods` VALUES ('7ba6fbd6b82c4c1e9e1b26db5cd0f7cb', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '奶茶精选', '-1');
INSERT INTO `seller_goods` VALUES ('7c33b021591644e587681bcf0ea767c6', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '鲜奶铁', '-1');
INSERT INTO `seller_goods` VALUES ('81bba2db37184e30b4152e88f18a40ce', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '创意尝尝先', '-1');
INSERT INTO `seller_goods` VALUES ('84d42445c1cb4e1286eb93677ca45673', '9b603743615c4721841c843ea4381bc6', '特色粥品', '-1');
INSERT INTO `seller_goods` VALUES ('862574c9947a44449a29c668d503ff5a', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '水果真的好', '-1');
INSERT INTO `seller_goods` VALUES ('8bca3f2412774673af9de7a34a485439', 'f8f447e1ec6442748b46c1724e0f2e0d', '正宗韩式手工面系列', '-1');
INSERT INTO `seller_goods` VALUES ('940292f979844418b71814a772729a80', '9b603743615c4721841c843ea4381bc6', '爽口凉菜', '-1');
INSERT INTO `seller_goods` VALUES ('94bc712693624b3c8de36286dca90009', '16a6ffaa1638479e8e3dd0b33d04d91c', '饭类', '-1');
INSERT INTO `seller_goods` VALUES ('af758a4e19e4422c99688103c8f21db6', '9b603743615c4721841c843ea4381bc6', '小吃主食', '-1');
INSERT INTO `seller_goods` VALUES ('bada938f65594ea985ac47e6b3ea360c', '16a6ffaa1638479e8e3dd0b33d04d91c', '套餐', '-1');
INSERT INTO `seller_goods` VALUES ('bb9fbaa52a664647b1e9e06efff7f8a9', 'f8f447e1ec6442748b46c1724e0f2e0d', '首尔小吃系列', '-1');
INSERT INTO `seller_goods` VALUES ('d18e7ccd704147e8b3a42e3a0f37c5b0', 'f8f447e1ec6442748b46c1724e0f2e0d', '寿司系列', '-1');
INSERT INTO `seller_goods` VALUES ('d7f43337f8774cf29cbb7f40dd3bf917', '9b603743615c4721841c843ea4381bc6', '果拼果汁', '-1');
INSERT INTO `seller_goods` VALUES ('e227f8f1a9054d94a0c71336fe525383', '9b603743615c4721841c843ea4381bc6', '冰爽饮品限时特惠', '1');
INSERT INTO `seller_goods` VALUES ('e95c93f65d6e4ae18f5e3c32694994cc', '9b603743615c4721841c843ea4381bc6', '热销榜', '-1');
INSERT INTO `seller_goods` VALUES ('f8f09d924a9c4d2db3b6b1b8970aaa7d', '16a6ffaa1638479e8e3dd0b33d04d91c', '汤粉类', '-1');
INSERT INTO `seller_goods` VALUES ('fd2acf050439441cadeb0fab2f2808f3', '9b603743615c4721841c843ea4381bc6', '精选套餐', '-1');

-- ----------------------------
-- Table structure for seller_ratings
-- ----------------------------
DROP TABLE IF EXISTS `seller_ratings`;
CREATE TABLE `seller_ratings` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `seller_id` varchar(32) DEFAULT NULL COMMENT '商家ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `ratetime` bigint(32) DEFAULT NULL COMMENT '评论时间',
  `deliverytime` int(8) DEFAULT NULL COMMENT '配送时间',
  `score` decimal(2,1) DEFAULT NULL COMMENT '评分',
  `ratetype` tinyint(2) DEFAULT NULL COMMENT '评论类型',
  `text` varchar(1024) DEFAULT NULL COMMENT '评论内容',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像',
  `recommend` varchar(1024) DEFAULT NULL COMMENT '购买商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家评论表';

-- ----------------------------
-- Records of seller_ratings
-- ----------------------------

-- ----------------------------
-- Table structure for seller_supports
-- ----------------------------
DROP TABLE IF EXISTS `seller_supports`;
CREATE TABLE `seller_supports` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `seller_id` varchar(32) DEFAULT NULL COMMENT '商家ID',
  `type` tinyint(2) DEFAULT NULL COMMENT '活动类型',
  `description` varchar(1024) DEFAULT NULL COMMENT '活动描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家活动表';

-- ----------------------------
-- Records of seller_supports
-- ----------------------------
INSERT INTO `seller_supports` VALUES ('12f6801eae4b4cb1b8793ccb6aebaf6b', 'bad61a4a4c7f464d8b5ac0c4d9a5739b', '4', '已加入“外卖保”计划，食品安全有保障');
INSERT INTO `seller_supports` VALUES ('1a8c49eda9cb4e4e80bb2e0ec80c003b', '9b603743615c4721841c843ea4381bc6', '1', '在线支付满28减5');
INSERT INTO `seller_supports` VALUES ('56681106ed7b454399626b58a3d0866f', '6838ff2d9acc45d38e2558ac6fb39f1d', '3', '该商家支持开发票，开票订单金额10.0元起，请在下单时填写好发票抬头');
INSERT INTO `seller_supports` VALUES ('58c8e898e556498381ba6dd7e64e9423', 'eca920c7233f484da8f14fe3a95ed200', '3', '该商家支持开发票，开票订单金额100.0元起，请在下单时填写好发票抬头');
INSERT INTO `seller_supports` VALUES ('60836573cd5e4b428aac5f777d5e848c', '9aabbdc632a6448cad6d41c20a4a0a5c', '4', '已加入“外卖保”计划，食品安全有保障');
INSERT INTO `seller_supports` VALUES ('63977c879e09470b895327172d1fee7d', '9b603743615c4721841c843ea4381bc6', '3', '该商家支持发票,请下单写好发票抬头');
INSERT INTO `seller_supports` VALUES ('8050be858efd47aaa269a90cc03e69b0', 'f3f45df2ed1b4f01859737d422c94b92', '4', '已加入“外卖保”计划，食品安全有保障');
INSERT INTO `seller_supports` VALUES ('898a1ad5d52c404a862fa1b2c3447139', 'e1aed97a05db456a837561e7656655a8', '3', '该商家支持开发票，请在下单时填写好发票抬头');
INSERT INTO `seller_supports` VALUES ('89e9d67634de4464828f1c21a1173919', '9b603743615c4721841c843ea4381bc6', '2', 'VC无限橙果汁全场8折');
INSERT INTO `seller_supports` VALUES ('9452a8fe6f0340298e31ef79e8566296', 'e1aed97a05db456a837561e7656655a8', '4', '已加入“外卖保”计划，食品安全有保障');
INSERT INTO `seller_supports` VALUES ('b4962702b592459e88307dc670f14386', 'e07a809eac404d4daa3e6fadf91a2fa4', '4', '已加入“外卖保”计划，食品安全有保障');
INSERT INTO `seller_supports` VALUES ('d7dd8364717d4588973ad9d93584c003', '9b603743615c4721841c843ea4381bc6', '4', '已加入“外卖保”计划,食品安全保障');
INSERT INTO `seller_supports` VALUES ('f9793d42b3764ed49ced12068e7e39b8', '16a6ffaa1638479e8e3dd0b33d04d91c', '4', '已加入“外卖保”计划，食品安全有保障');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `name` varchar(128) DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(1024) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(128) DEFAULT NULL COMMENT '收获人名称',
  `sex` varchar(8) DEFAULT NULL COMMENT '性别',
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `phone` int(16) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_ratings
-- ----------------------------
DROP TABLE IF EXISTS `user_ratings`;
CREATE TABLE `user_ratings` (
  `id` varchar(32) NOT NULL COMMENT '标识符',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `ratings_id` varchar(32) DEFAULT NULL COMMENT '评论ID',
  `ratings_type` tinyint(2) DEFAULT NULL COMMENT '评论类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户评论表';

-- ----------------------------
-- Records of user_ratings
-- ----------------------------
