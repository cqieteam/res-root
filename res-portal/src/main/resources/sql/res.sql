/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-10-30 18:08:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `js_filemanager_folder`
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_folder`;
CREATE TABLE `js_filemanager_folder` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `folder_name` varchar(100) NOT NULL COMMENT '文件夹名',
  `group_type` varchar(64) NOT NULL COMMENT '文件分组类型',
  `office_code` varchar(64) DEFAULT NULL COMMENT '部门编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_tree_pc` (`parent_code`),
  KEY `idx_sys_file_tree_ts` (`tree_sort`),
  KEY `idx_sys_file_tree_tss` (`tree_sorts`),
  KEY `idx_sys_file_tree_gt` (`group_type`),
  KEY `idx_sys_file_tree_oc` (`office_code`),
  KEY `idx_sys_file_tree_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理文件夹';

-- ----------------------------
-- Records of js_filemanager_folder
-- ----------------------------
INSERT INTO `js_filemanager_folder` VALUES ('1186830453236883456', '0', '0,', '40', '0000000040,', '0', '0', '公司文件', '公司文件', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453417238528', '1186830453236883456', '0,1186830453236883456,', '30', '0000000040,0000000030,', '1', '1', '公司文件/规章制度', '规章制度', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453471764480', '1186830453236883456', '0,1186830453236883456,', '40', '0000000040,0000000040,', '1', '1', '公司文件/产品资料', '产品资料', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453513707520', '0', '0,', '50', '0000000050,', '0', '0', '员工之家', '员工之家', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453534679040', '1186830453513707520', '0,1186830453513707520,', '30', '0000000050,0000000030,', '1', '1', '员工之家/企业文化', '企业文化', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453576622080', '1186830453513707520', '0,1186830453513707520,', '40', '0000000050,0000000040,', '1', '1', '员工之家/公司活动', '公司活动', 'global', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453685673984', '0', '0,', '30', '0000000030,', '1', '0', '我的文档', '我的文档', 'self', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');
INSERT INTO `js_filemanager_folder` VALUES ('1186830453719228416', '0', '0,', '40', '0000000040,', '1', '0', '我的图片', '我的图片', 'self', null, '0', 'system', '2019-10-23 10:23:25', 'system', '2019-10-23 10:23:25', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for `js_filemanager_shared`
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_shared`;
CREATE TABLE `js_filemanager_shared` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `folder_id` varchar(64) DEFAULT NULL COMMENT '文件夹编码',
  `file_upload_id` varchar(64) DEFAULT NULL COMMENT '文件上传编码',
  `file_name` varchar(500) NOT NULL COMMENT '文件或文件夹名',
  `receive_user_code` varchar(100) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(200) NOT NULL COMMENT '接收者用户名称',
  `click_num` decimal(10,0) DEFAULT NULL COMMENT '点击次数',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_share_ruc` (`receive_user_code`),
  KEY `idx_sys_file_share_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理共享表';

-- ----------------------------
-- Records of js_filemanager_shared
-- ----------------------------

-- ----------------------------
-- Table structure for `js_gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table`;
CREATE TABLE `js_gen_table` (
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `parent_table_name` varchar(64) DEFAULT NULL COMMENT '关联父表的表名',
  `parent_table_fk_name` varchar(64) DEFAULT NULL COMMENT '本表关联父表的外键名',
  `data_source_name` varchar(64) DEFAULT NULL COMMENT '数据源名称',
  `tpl_category` varchar(200) DEFAULT NULL COMMENT '使用的模板',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_base_dir` varchar(1000) DEFAULT NULL COMMENT '生成基础路径',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`table_name`),
  KEY `idx_gen_table_ptn` (`parent_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表';

-- ----------------------------
-- Records of js_gen_table
-- ----------------------------
INSERT INTO `js_gen_table` VALUES ('test_data', 'TestData', '测试数据', null, null, null, 'crud', 'com.jeesite.modules', 'test', '', '测试数据', '数据', 'ThinkGem', null, '{\"isHaveDelete\":\"1\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null);
INSERT INTO `js_gen_table` VALUES ('test_data_child', 'TestDataChild', '测试数据子表', 'test_data', 'test_data_id', null, 'crud', 'com.jeesite.modules', 'test', '', '测试子表', '数据', 'ThinkGem', null, null, 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null);
INSERT INTO `js_gen_table` VALUES ('test_tree', 'TestTree', '测试树表', null, null, null, 'treeGrid', 'com.jeesite.modules', 'test', '', '测试树表', '数据', 'ThinkGem', null, '{\"treeViewName\":\"tree_name\",\"isHaveDelete\":\"1\",\"treeViewCode\":\"tree_code\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null);

-- ----------------------------
-- Table structure for `js_gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table_column`;
CREATE TABLE `js_gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表列';

-- ----------------------------
-- Records of js_gen_table_column
-- ----------------------------
INSERT INTO `js_gen_table_column` VALUES ('1186830436208009216', 'test_data', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436254146560', 'test_data', 'test_input', '20', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436262535168', 'test_data', 'test_textarea', '30', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436270923776', 'test_data', 'test_select', '40', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436325449728', 'test_data', 'test_select_multiple', '50', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436338032640', 'test_data', 'test_radio', '60', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436350615552', 'test_data', 'test_checkbox', '70', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436363198464', 'test_data', 'test_date', '80', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436384169984', 'test_data', 'test_datetime', '90', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436396752896', 'test_data', 'test_user_code', '100', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436405141504', 'test_data', 'test_office_code', '110', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436413530112', 'test_data', 'test_area_code', '120', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436430307328', 'test_data', 'test_area_name', '130', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436442890240', 'test_data', 'status', '140', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436451278848', 'test_data', 'create_by', '150', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436459667456', 'test_data', 'create_date', '160', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436468056064', 'test_data', 'update_by', '170', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436476444672', 'test_data', 'update_date', '180', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436489027584', 'test_data', 'remarks', '190', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436874903552', 'test_data_child', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436883292160', 'test_data_child', 'test_sort', '20', 'int(11)', '排序号', '排序号', 'testSort', 'Long', null, '1', '1', '1', '1', '1', null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436891680768', 'test_data_child', 'test_data_id', '30', 'varchar(64)', '父表主键', '父表主键', 'testData', 'String', null, '1', '1', '1', '1', '1', null, '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436904263680', 'test_data_child', 'test_input', '40', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436912652288', 'test_data_child', 'test_textarea', '50', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436925235200', 'test_data_child', 'test_select', '60', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436937818112', 'test_data_child', 'test_select_multiple', '70', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436946206720', 'test_data_child', 'test_radio', '80', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436958789632', 'test_data_child', 'test_checkbox', '90', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830436967178240', 'test_data_child', 'test_date', '100', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436979761152', 'test_data_child', 'test_datetime', '110', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830436988149760', 'test_data_child', 'test_user_code', '120', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437000732672', 'test_data_child', 'test_office_code', '130', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437009121280', 'test_data_child', 'test_area_code', '140', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437017509888', 'test_data_child', 'test_area_name', '150', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437655044096', 'test_tree', 'tree_code', '10', 'varchar(64)', '节点编码', '节点编码', 'treeCode', 'String', '1', '0', '1', null, null, null, null, '1', 'input', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830437663432704', 'test_tree', 'parent_code', '20', 'varchar(64)', '父级编号', '父级编号', 'parentCode|parentName', 'This', null, '0', '1', '1', null, null, null, null, 'treeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437667627008', 'test_tree', 'parent_codes', '30', 'varchar(1000)', '所有父级编号', '所有父级编号', 'parentCodes', 'String', null, '0', '1', '1', null, null, 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437676015616', 'test_tree', 'tree_sort', '40', 'decimal(10,0)', '本级排序号', '本级排序号（升序）', 'treeSort', 'Integer', null, '0', '1', '1', '1', null, null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830437684404224', 'test_tree', 'tree_sorts', '50', 'varchar(1000)', '所有级别排序号', '所有级别排序号', 'treeSorts', 'String', null, '0', '1', '1', '0', null, null, '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437692792832', 'test_tree', 'tree_leaf', '60', 'char(1)', '是否最末级', '是否最末级', 'treeLeaf', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437701181440', 'test_tree', 'tree_level', '70', 'decimal(4,0)', '层次级别', '层次级别', 'treeLevel', 'Integer', null, '0', '1', '1', null, null, null, null, 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830437709570048', 'test_tree', 'tree_names', '80', 'varchar(1000)', '全节点名', '全节点名', 'treeNames', 'String', null, '0', '1', '1', null, '1', 'LIKE', null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437717958656', 'test_tree', 'tree_name', '90', 'varchar(200)', '节点名称', '节点名称', 'treeName', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437722152960', 'test_tree', 'status', '100', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186830437730541568', 'test_tree', 'create_by', '110', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437738930176', 'test_tree', 'create_date', '120', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437747318784', 'test_tree', 'update_by', '130', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437755707392', 'test_tree', 'update_date', '140', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186830437759901696', 'test_tree', 'remarks', '150', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');

-- ----------------------------
-- Table structure for `js_job_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_blob_triggers`;
CREATE TABLE `js_job_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_calendars`;
CREATE TABLE `js_job_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_cron_triggers`;
CREATE TABLE `js_job_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_fired_triggers`;
CREATE TABLE `js_job_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_job_details`;
CREATE TABLE `js_job_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_locks`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_locks`;
CREATE TABLE `js_job_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_paused_trigger_grps`;
CREATE TABLE `js_job_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_scheduler_state`;
CREATE TABLE `js_job_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simple_triggers`;
CREATE TABLE `js_job_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simprop_triggers`;
CREATE TABLE `js_job_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_job_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `js_job_triggers`;
CREATE TABLE `js_job_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `js_job_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `js_job_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_area`;
CREATE TABLE `js_sys_area` (
  `area_code` varchar(100) NOT NULL COMMENT '区域编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `area_name` varchar(100) NOT NULL COMMENT '区域名称',
  `area_type` char(1) DEFAULT NULL COMMENT '区域类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`area_code`),
  KEY `idx_sys_area_pc` (`parent_code`),
  KEY `idx_sys_area_ts` (`tree_sort`),
  KEY `idx_sys_area_status` (`status`),
  KEY `idx_sys_area_pcs` (`parent_codes`),
  KEY `idx_sys_area_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of js_sys_area
-- ----------------------------
INSERT INTO `js_sys_area` VALUES ('370000', '0', '0,', '370000', '0000370000,', '0', '0', '山东省', '山东省', '1', '0', 'system', '2019-10-23 10:23:08', 'system', '2019-10-23 10:23:08', null);
INSERT INTO `js_sys_area` VALUES ('370100', '370000', '0,370000,', '370100', '0000370000,0000370100,', '0', '1', '山东省/济南市', '济南市', '2', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370102', '370100', '0,370000,370100,', '370102', '0000370000,0000370100,0000370102,', '1', '2', '山东省/济南市/历下区', '历下区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370103', '370100', '0,370000,370100,', '370103', '0000370000,0000370100,0000370103,', '1', '2', '山东省/济南市/市中区', '市中区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370104', '370100', '0,370000,370100,', '370104', '0000370000,0000370100,0000370104,', '1', '2', '山东省/济南市/槐荫区', '槐荫区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370105', '370100', '0,370000,370100,', '370105', '0000370000,0000370100,0000370105,', '1', '2', '山东省/济南市/天桥区', '天桥区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370112', '370100', '0,370000,370100,', '370112', '0000370000,0000370100,0000370112,', '1', '2', '山东省/济南市/历城区', '历城区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370113', '370100', '0,370000,370100,', '370113', '0000370000,0000370100,0000370113,', '1', '2', '山东省/济南市/长清区', '长清区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370114', '370100', '0,370000,370100,', '370114', '0000370000,0000370100,0000370114,', '1', '2', '山东省/济南市/章丘区', '章丘区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370124', '370100', '0,370000,370100,', '370124', '0000370000,0000370100,0000370124,', '1', '2', '山东省/济南市/平阴县', '平阴县', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370125', '370100', '0,370000,370100,', '370125', '0000370000,0000370100,0000370125,', '1', '2', '山东省/济南市/济阳县', '济阳县', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370126', '370100', '0,370000,370100,', '370126', '0000370000,0000370100,0000370126,', '1', '2', '山东省/济南市/商河县', '商河县', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370200', '370000', '0,370000,', '370200', '0000370000,0000370200,', '0', '1', '山东省/青岛市', '青岛市', '2', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370202', '370200', '0,370000,370200,', '370202', '0000370000,0000370200,0000370202,', '1', '2', '山东省/青岛市/市南区', '市南区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370203', '370200', '0,370000,370200,', '370203', '0000370000,0000370200,0000370203,', '1', '2', '山东省/青岛市/市北区', '市北区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370211', '370200', '0,370000,370200,', '370211', '0000370000,0000370200,0000370211,', '1', '2', '山东省/青岛市/黄岛区', '黄岛区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370212', '370200', '0,370000,370200,', '370212', '0000370000,0000370200,0000370212,', '1', '2', '山东省/青岛市/崂山区', '崂山区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370213', '370200', '0,370000,370200,', '370213', '0000370000,0000370200,0000370213,', '1', '2', '山东省/青岛市/李沧区', '李沧区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370214', '370200', '0,370000,370200,', '370214', '0000370000,0000370200,0000370214,', '1', '2', '山东省/青岛市/城阳区', '城阳区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370281', '370200', '0,370000,370200,', '370281', '0000370000,0000370200,0000370281,', '1', '2', '山东省/青岛市/胶州市', '胶州市', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370282', '370200', '0,370000,370200,', '370282', '0000370000,0000370200,0000370282,', '1', '2', '山东省/青岛市/即墨区', '即墨区', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370283', '370200', '0,370000,370200,', '370283', '0000370000,0000370200,0000370283,', '1', '2', '山东省/青岛市/平度市', '平度市', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);
INSERT INTO `js_sys_area` VALUES ('370285', '370200', '0,370000,370200,', '370285', '0000370000,0000370200,0000370285,', '1', '2', '山东省/青岛市/莱西市', '莱西市', '3', '0', 'system', '2019-10-23 10:23:09', 'system', '2019-10-23 10:23:09', null);

-- ----------------------------
-- Table structure for `js_sys_company`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company`;
CREATE TABLE `js_sys_company` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '公司代码',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `full_name` varchar(200) NOT NULL COMMENT '公司全称',
  `area_code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`company_code`),
  KEY `idx_sys_company_cc` (`corp_code`),
  KEY `idx_sys_company_pc` (`parent_code`),
  KEY `idx_sys_company_ts` (`tree_sort`),
  KEY `idx_sys_company_status` (`status`),
  KEY `idx_sys_company_vc` (`view_code`),
  KEY `idx_sys_company_pcs` (`parent_codes`),
  KEY `idx_sys_company_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of js_sys_company
-- ----------------------------
INSERT INTO `js_sys_company` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '1', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '1', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_company_office`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company_office`;
CREATE TABLE `js_sys_company_office` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  PRIMARY KEY (`company_code`,`office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司部门关联表';

-- ----------------------------
-- Records of js_sys_company_office
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_config`;
CREATE TABLE `js_sys_config` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `config_name` varchar(100) NOT NULL COMMENT '名称',
  `config_key` varchar(100) NOT NULL COMMENT '参数键',
  `config_value` varchar(1000) DEFAULT NULL COMMENT '参数值',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of js_sys_config
-- ----------------------------
INSERT INTO `js_sys_config` VALUES ('1186830390448152576', '研发工具-代码生成默认包名', 'gen.defaultPackageName', 'com.jeesite.modules', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '新建项目后，修改该键值，在生成代码的时候就不要再修改了');
INSERT INTO `js_sys_config` VALUES ('1186830390850805760', '主框架页-桌面仪表盘首页地址', 'sys.index.desktopUrl', '/desktop', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '主页面的第一个页签首页桌面地址');
INSERT INTO `js_sys_config` VALUES ('1186830390980829184', '主框架页-主导航菜单显示风格', 'sys.index.menuStyle', '1', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '1：菜单全部在左侧；2：根菜单显示在顶部');
INSERT INTO `js_sys_config` VALUES ('1186830391115046912', '主框架页-侧边栏的默认显示样式', 'sys.index.sidebarStyle', '1', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '1：默认显示侧边栏；2：默认折叠侧边栏');
INSERT INTO `js_sys_config` VALUES ('1186830391236681728', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue-light2', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', 'skin-black-light、skin-black、skin-blue-light、skin-blue、skin-green-light、skin-green、skin-purple-light、skin-purple、skin-red-light、skin-red、skin-yellow-light、skin-yellow');
INSERT INTO `js_sys_config` VALUES ('1186830391370899456', '用户登录-登录失败多少次数后显示验证码', 'sys.login.failedNumAfterValidCode', '100', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '设置为0强制使用验证码登录');
INSERT INTO `js_sys_config` VALUES ('1186830391496728576', '用户登录-登录失败多少次数后锁定账号', 'sys.login.failedNumAfterLockAccount', '200', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '登录失败多少次数后锁定账号');
INSERT INTO `js_sys_config` VALUES ('1186830391605780480', '用户登录-登录失败多少次数后锁定账号的时间', 'sys.login.failedNumAfterLockMinute', '20', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '锁定账号的时间（单位：分钟）');
INSERT INTO `js_sys_config` VALUES ('1186830391723220992', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '是否开启注册用户功能');
INSERT INTO `js_sys_config` VALUES ('1186830391844855808', '账号自助-允许自助注册的用户类型', 'sys.account.registerUser.userTypes', '-1', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '允许注册的用户类型（多个用逗号隔开，如果注册时不选择用户类型，则第一个为默认类型）');
INSERT INTO `js_sys_config` VALUES ('1186830391974879232', '账号自助-验证码有效时间（分钟）', 'sys.account.validCodeTimeout', '10', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '找回密码时，短信/邮件验证码有效时间（单位：分钟，0表示不限制）');
INSERT INTO `js_sys_config` VALUES ('1186830392100708352', '用户管理-账号默认角色-员工类型', 'sys.user.defaultRoleCodes.employee', 'default', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '所有员工用户都拥有的角色权限（适用于菜单授权查询）');
INSERT INTO `js_sys_config` VALUES ('1186830392222343168', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '创建用户和重置密码的时候用户的密码');
INSERT INTO `js_sys_config` VALUES ('1186830392343977984', '用户管理-初始密码修改策略', 'sys.user.initPasswordModify', '1', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '0：初始密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作');
INSERT INTO `js_sys_config` VALUES ('1186830392478195712', '用户管理-账号密码修改策略', 'sys.user.passwordModify', '1', '0', 'system', '2019-10-23 10:23:10', 'system', '2019-10-23 10:23:10', '0：密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作。');
INSERT INTO `js_sys_config` VALUES ('1186830392604024832', '用户管理-账号密码修改策略验证周期', 'sys.user.passwordModifyCycle', '30', '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:23:11', '密码安全修改周期是指定时间内提醒或必须修改密码（例如设置30天）的验证时间（天），超过这个时间登录系统时需，提醒用户修改密码或强制修改密码才能继续使用系统。单位：天，如果设置30天，则第31天开始强制修改密码');
INSERT INTO `js_sys_config` VALUES ('1186830392708882432', '用户管理-密码修改多少次内不允许重复', 'sys.user.passwordModifyNotRepeatNum', '1', '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:23:11', '默认1次，表示不能与上次密码重复；若设置为3，表示并与前3次密码重复');
INSERT INTO `js_sys_config` VALUES ('1186830392826322944', '用户管理-账号密码修改最低安全等级', 'sys.user.passwordModifySecurityLevel', '0', '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:23:11', '0：不限制等级（用户在修改密码的时候不进行等级验证）\r；1：限制最低等级为很弱\r；2：限制最低等级为弱\r；3：限制最低等级为安全\r；4：限制最低等级为很安全');

-- ----------------------------
-- Table structure for `js_sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_data`;
CREATE TABLE `js_sys_dict_data` (
  `dict_code` varchar(64) NOT NULL COMMENT '字典编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `dict_label` varchar(100) NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `description` varchar(500) DEFAULT NULL COMMENT '字典描述',
  `css_style` varchar(500) DEFAULT NULL COMMENT 'css样式（如：color:red)',
  `css_class` varchar(500) DEFAULT NULL COMMENT 'css类名（如：red）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_cc` (`corp_code`),
  KEY `idx_sys_dict_data_dt` (`dict_type`),
  KEY `idx_sys_dict_data_pc` (`parent_code`),
  KEY `idx_sys_dict_data_status` (`status`),
  KEY `idx_sys_dict_data_pcs` (`parent_codes`),
  KEY `idx_sys_dict_data_ts` (`tree_sort`),
  KEY `idx_sys_dict_data_tss` (`tree_sorts`),
  KEY `idx_sys_dict_data_dv` (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of js_sys_dict_data
-- ----------------------------
INSERT INTO `js_sys_dict_data` VALUES ('1186830402464833536', '0', '0,', '30', '0000000030,', '1', '0', '是', '是', '1', 'sys_yes_no', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403018481664', '0', '0,', '40', '0000000040,', '1', '0', '否', '否', '0', 'sys_yes_no', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403089784832', '0', '0,', '20', '0000000020,', '1', '0', '正常', '正常', '0', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403165282304', '0', '0,', '30', '0000000030,', '1', '0', '删除', '删除', '1', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403240779776', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403882508288', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403937034240', '0', '0,', '60', '0000000060,', '1', '0', '待审', '待审', '4', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830403983171584', '0', '0,', '70', '0000000070,', '1', '0', '驳回', '驳回', '5', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404033503232', '0', '0,', '80', '0000000080,', '1', '0', '草稿', '草稿', '9', 'sys_status', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404079640576', '0', '0,', '30', '0000000030,', '1', '0', '显示', '显示', '1', 'sys_show_hide', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404125777920', '0', '0,', '40', '0000000040,', '1', '0', '隐藏', '隐藏', '0', 'sys_show_hide', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404176109568', '0', '0,', '30', '0000000030,', '1', '0', '简体中文', '简体中文', 'zh_CN', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404230635520', '0', '0,', '40', '0000000040,', '1', '0', 'English', 'English', 'en', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404280967168', '0', '0,', '60', '0000000060,', '1', '0', '日本語', '日本語', 'ja_JP', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404322910208', '0', '0,', '30', '0000000030,', '1', '0', 'PC电脑', 'PC电脑', 'pc', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404369047552', '0', '0,', '40', '0000000040,', '1', '0', '手机APP', '手机APP', 'mobileApp', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404448739328', '0', '0,', '50', '0000000050,', '1', '0', '手机Web', '手机Web', 'mobileWeb', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404507459584', '0', '0,', '60', '0000000060,', '1', '0', '微信设备', '微信设备', 'weixin', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404561985536', '0', '0,', '30', '0000000030,', '1', '0', '主导航菜单', '主导航菜单', 'default', 'sys_menu_sys_code', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404608122880', '0', '0,', '30', '0000000030,', '1', '0', '菜单', '菜单', '1', 'sys_menu_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404654260224', '0', '0,', '40', '0000000040,', '1', '0', '权限', '权限', '2', 'sys_menu_type', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404708786176', '0', '0,', '30', '0000000030,', '1', '0', '默认权重', '默认权重', '20', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404763312128', '0', '0,', '40', '0000000040,', '1', '0', '二级管理员', '二级管理员', '40', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404809449472', '0', '0,', '50', '0000000050,', '1', '0', '系统管理员', '系统管理员', '60', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404855586816', '0', '0,', '60', '0000000060,', '1', '0', '超级管理员', '超级管理员', '80', 'sys_menu_weight', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404914307072', '0', '0,', '30', '0000000030,', '1', '0', '国家', '国家', '0', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830404981415936', '0', '0,', '40', '0000000040,', '1', '0', '省份直辖市', '省份直辖市', '1', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405027553280', '0', '0,', '50', '0000000050,', '1', '0', '地市', '地市', '2', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405090467840', '0', '0,', '60', '0000000060,', '1', '0', '区县', '区县', '3', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405140799488', '0', '0,', '30', '0000000030,', '1', '0', '省级公司', '省级公司', '1', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405186936832', '0', '0,', '40', '0000000040,', '1', '0', '市级公司', '市级公司', '2', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405241462784', '0', '0,', '50', '0000000050,', '1', '0', '部门', '部门', '3', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405295988736', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_search_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405346320384', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_search_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405392457728', '0', '0,', '30', '0000000030,', '1', '0', '男', '男', '1', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405438595072', '0', '0,', '40', '0000000040,', '1', '0', '女', '女', '2', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405493121024', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_user_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405543452672', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_user_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405593784320', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_user_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405639921664', '0', '0,', '30', '0000000030,', '1', '0', '员工', '员工', 'employee', 'sys_user_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830405686059008', '0', '0,', '40', '0000000040,', '1', '0', '会员', '会员', 'member', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406168403968', '0', '0,', '50', '0000000050,', '1', '0', '单位', '单位', 'btype', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406218735616', '0', '0,', '60', '0000000060,', '1', '0', '个人', '个人', 'persion', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406264872960', '0', '0,', '70', '0000000070,', '1', '0', '专家', '专家', 'expert', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406306816000', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406348759040', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406394896384', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406436839424', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406491365376', '0', '0,', '30', '0000000030,', '1', '0', '未设置', '未设置', '0', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406541697024', '0', '0,', '40', '0000000040,', '1', '0', '全部数据', '全部数据', '1', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406583640064', '0', '0,', '50', '0000000050,', '1', '0', '自定义数据', '自定义数据', '2', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406625583104', '0', '0,', '60', '0000000060,', '1', '0', '本部门数据', '本部门数据', '3', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406675914752', '0', '0,', '70', '0000000070,', '1', '0', '本公司数据', '本公司数据', '4', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406743023616', '0', '0,', '80', '0000000080,', '1', '0', '本部门和本公司数据', '本部门和本公司数据', '5', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406789160960', '0', '0,', '30', '0000000030,', '1', '0', '组织管理', '组织管理', 'office_user', 'sys_role_biz_scope', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406835298304', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406885629952', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406927572992', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830406969516032', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407019847680', '0', '0,', '30', '0000000030,', '1', '0', '接入日志', '接入日志', 'access', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407065985024', '0', '0,', '40', '0000000040,', '1', '0', '修改日志', '修改日志', 'update', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407107928064', '0', '0,', '50', '0000000050,', '1', '0', '查询日志', '查询日志', 'select', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407149871104', '0', '0,', '60', '0000000060,', '1', '0', '登录登出', '登录登出', 'loginLogout', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407191814144', '0', '0,', '30', '0000000030,', '1', '0', '默认', '默认', 'DEFAULT', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407233757184', '0', '0,', '40', '0000000040,', '1', '0', '系统', '系统', 'SYSTEM', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407284088832', '0', '0,', '30', '0000000030,', '1', '0', '错过计划等待本次计划完成后立即执行一次', '错过计划等待本次计划完成后立即执行一次', '1', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407330226176', '0', '0,', '40', '0000000040,', '1', '0', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '2', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407372169216', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407414112256', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407451860992', '0', '0,', '50', '0000000050,', '1', '0', '暂停', '暂停', '2', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407506386944', '0', '0,', '30', '0000000030,', '1', '0', '完成', '完成', '3', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407548329984', '0', '0,', '40', '0000000040,', '1', '0', '错误', '错误', '4', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407586078720', '0', '0,', '50', '0000000050,', '1', '0', '运行', '运行', '5', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407628021760', '0', '0,', '30', '0000000030,', '1', '0', '计划日志', '计划日志', 'scheduler', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407669964800', '0', '0,', '40', '0000000040,', '1', '0', '任务日志', '任务日志', 'job', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407711907840', '0', '0,', '50', '0000000050,', '1', '0', '触发日志', '触发日志', 'trigger', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407758045184', '0', '0,', '30', '0000000030,', '1', '0', '计划创建', '计划创建', 'jobScheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407804182528', '0', '0,', '40', '0000000040,', '1', '0', '计划移除', '计划移除', 'jobUnscheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407854514176', '0', '0,', '50', '0000000050,', '1', '0', '计划暂停', '计划暂停', 'triggerPaused', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407892262912', '0', '0,', '60', '0000000060,', '1', '0', '计划恢复', '计划恢复', 'triggerResumed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407930011648', '0', '0,', '70', '0000000070,', '1', '0', '调度错误', '调度错误', 'schedulerError', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830407967760384', '0', '0,', '80', '0000000080,', '1', '0', '任务执行', '任务执行', 'jobToBeExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408013897728', '0', '0,', '90', '0000000090,', '1', '0', '任务结束', '任务结束', 'jobWasExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408068423680', '0', '0,', '100', '0000000100,', '1', '0', '任务停止', '任务停止', 'jobExecutionVetoed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408114561024', '0', '0,', '110', '0000000110,', '1', '0', '触发计划', '触发计划', 'triggerFired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408160698368', '0', '0,', '120', '0000000120,', '1', '0', '触发验证', '触发验证', 'vetoJobExecution', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408206835712', '0', '0,', '130', '0000000130,', '1', '0', '触发完成', '触发完成', 'triggerComplete', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408248778752', '0', '0,', '140', '0000000140,', '1', '0', '触发错过', '触发错过', 'triggerMisfired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408286527488', '0', '0,', '30', '0000000030,', '1', '0', 'PC', 'PC', 'pc', 'sys_msg_type', '1', '消息类型', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408336859136', '0', '0,', '40', '0000000040,', '1', '0', 'APP', 'APP', 'app', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408374607872', '0', '0,', '50', '0000000050,', '1', '0', '短信', '短信', 'sms', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408416550912', '0', '0,', '60', '0000000060,', '1', '0', '邮件', '邮件', 'email', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408454299648', '0', '0,', '70', '0000000070,', '1', '0', '微信', '微信', 'weixin', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408492048384', '0', '0,', '30', '0000000030,', '1', '0', '待推送', '待推送', '0', 'sys_msg_push_status', '1', '推送状态', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408538185728', '0', '0,', '30', '0000000030,', '1', '0', '成功', '成功', '1', 'sys_msg_push_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408588517376', '0', '0,', '40', '0000000040,', '1', '0', '失败', '失败', '2', 'sys_msg_push_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408630460416', '0', '0,', '30', '0000000030,', '1', '0', '未送达', '未送达', '0', 'sys_msg_read_status', '1', '读取状态', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408672403456', '0', '0,', '40', '0000000040,', '1', '0', '已读', '已读', '1', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408722735104', '0', '0,', '50', '0000000050,', '1', '0', '未读', '未读', '2', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408764678144', '0', '0,', '30', '0000000030,', '1', '0', '普通', '普通', '1', 'msg_inner_content_level', '1', '内容级别', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830408982781952', '0', '0,', '40', '0000000040,', '1', '0', '一般', '一般', '2', 'msg_inner_content_level', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409020530688', '0', '0,', '50', '0000000050,', '1', '0', '紧急', '紧急', '3', 'msg_inner_content_level', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409049890816', '0', '0,', '30', '0000000030,', '1', '0', '公告', '公告', '1', 'msg_inner_content_type', '1', '内容类型', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409083445248', '0', '0,', '40', '0000000040,', '1', '0', '新闻', '新闻', '2', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409129582592', '0', '0,', '50', '0000000050,', '1', '0', '会议', '会议', '3', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409171525632', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409209274368', '0', '0,', '30', '0000000030,', '1', '0', '全部', '全部', '0', 'msg_inner_receiver_type', '1', '接受类型', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409255411712', '0', '0,', '30', '0000000030,', '1', '0', '用户', '用户', '1', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409297354752', '0', '0,', '40', '0000000040,', '1', '0', '部门', '部门', '2', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409339297792', '0', '0,', '50', '0000000050,', '1', '0', '角色', '角色', '3', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:14', 'system', '2019-10-23 10:23:14', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409385435136', '0', '0,', '60', '0000000060,', '1', '0', '岗位', '岗位', '4', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409423183872', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'msg_inner_msg_status', '1', '消息状态', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409477709824', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409519652864', '0', '0,', '50', '0000000050,', '1', '0', '审核', '审核', '4', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409557401600', '0', '0,', '60', '0000000060,', '1', '0', '驳回', '驳回', '5', 'msg_inner_msg_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409595150336', '0', '0,', '70', '0000000070,', '1', '0', '草稿', '草稿', '9', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409649676288', '0', '0,', '30', '0000000030,', '1', '0', '公共文件柜', '公共文件柜', 'global', 'filemanager_group_type', '1', '文件组类型', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409687425024', '0', '0,', '40', '0000000040,', '1', '0', '个人文件柜', '个人文件柜', 'self', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186830409733562368', '0', '0,', '50', '0000000050,', '1', '0', '部门文件柜', '部门文件柜', 'office', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_type`;
CREATE TABLE `js_sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dict_name` varchar(100) NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '是否系统字典',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dict_type_is` (`is_sys`),
  KEY `idx_sys_dict_type_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of js_sys_dict_type
-- ----------------------------
INSERT INTO `js_sys_dict_type` VALUES ('1186830400040525824', '是否', 'sys_yes_no', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400149577728', '状态', 'sys_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400178937856', '显示隐藏', 'sys_show_hide', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400208297984', '国际化语言类型', 'sys_lang_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400246046720', '客户端设备类型', 'sys_device_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400287989760', '菜单归属系统', 'sys_menu_sys_code', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400317349888', '菜单类型', 'sys_menu_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400342515712', '菜单权重', 'sys_menu_weight', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400376070144', '区域类型', 'sys_area_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400405430272', '机构类型', 'sys_office_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400438984704', '查询状态', 'sys_search_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400468344832', '用户性别', 'sys_user_sex', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400497704960', '用户状态', 'sys_user_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400531259392', '用户类型', 'sys_user_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400569008128', '角色分类', 'sys_role_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400602562560', '角色数据范围', 'sys_role_data_scope', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400627728384', '角色业务范围', 'sys_role_biz_scope', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400657088512', '岗位分类', 'sys_post_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400686448640', '日志类型', 'sys_log_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400715808768', '作业分组', 'sys_job_group', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400745168896', '作业错过策略', 'sys_job_misfire_instruction', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400778723328', '作业状态', 'sys_job_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400808083456', '作业任务类型', 'sys_job_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400841637888', '作业任务事件', 'sys_job_event', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400875192320', '消息类型', 'sys_msg_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400904552448', '推送状态', 'sys_msg_push_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400933912576', '读取状态', 'sys_msg_read_status', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400959078400', '内容级别', 'msg_inner_content_level', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830400988438528', '内容类型', 'msg_inner_content_type', '1', '0', 'system', '2019-10-23 10:23:12', 'system', '2019-10-23 10:23:12', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830401013604352', '接受类型', 'msg_inner_receiver_type', '1', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830401055547392', '消息状态', 'msg_inner_msg_status', '1', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186830401089101824', '文件组类型', 'filemanager_group_type', '1', '0', 'system', '2019-10-23 10:23:13', 'system', '2019-10-23 10:23:13', null);

-- ----------------------------
-- Table structure for `js_sys_employee`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee`;
CREATE TABLE `js_sys_employee` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `emp_name` varchar(100) NOT NULL COMMENT '员工姓名',
  `emp_name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `company_code` varchar(64) DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `status` char(1) NOT NULL COMMENT '状态（0在职 1删除 2离职）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`emp_code`),
  KEY `idx_sys_employee_cco` (`company_code`),
  KEY `idx_sys_employee_cc` (`corp_code`),
  KEY `idx_sys_employee_ud` (`update_date`),
  KEY `idx_sys_employee_oc` (`office_code`),
  KEY `idx_sys_employee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of js_sys_employee
-- ----------------------------
INSERT INTO `js_sys_employee` VALUES ('user10_ofhe', '用户10', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user11_i8ut', '用户11', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user12_5ycu', '用户12', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user13_9vba', '用户13', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user14_ujlf', '用户14', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user15_r0jc', '用户15', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user16_yoso', '用户16', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user17_nraf', '用户17', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user18_tpdk', '用户18', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user19_jsc8', '用户19', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user1_xjkl', '用户01', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user20_ndrg', '用户20', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user21_9rwb', '用户21', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user22_n01o', '用户22', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user23_u2pw', '用户23', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user2_1j0x', '用户02', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user3_pxjf', '用户03', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user4_047q', '用户04', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user5_cc84', '用户05', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user6_2y8l', '用户06', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user7_vcvr', '用户07', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user8_udq2', '用户08', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user9_ai2w', '用户09', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for `js_sys_employee_office`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_office`;
CREATE TABLE `js_sys_employee_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `post_code` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`office_code`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工附属机构关系表';

-- ----------------------------
-- Records of js_sys_employee_office
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_employee_post`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_post`;
CREATE TABLE `js_sys_employee_post` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`post_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工与岗位关联表';

-- ----------------------------
-- Records of js_sys_employee_post
-- ----------------------------
INSERT INTO `js_sys_employee_post` VALUES ('user10_ofhe', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user11_i8ut', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user12_5ycu', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user13_9vba', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user14_ujlf', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user15_r0jc', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user16_yoso', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user17_nraf', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user18_tpdk', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user19_jsc8', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user1_xjkl', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user20_ndrg', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user21_9rwb', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user22_n01o', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user23_u2pw', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user2_1j0x', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user3_pxjf', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user4_047q', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user5_cc84', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user6_2y8l', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user7_vcvr', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user8_udq2', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user9_ai2w', 'user');

-- ----------------------------
-- Table structure for `js_sys_file_entity`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_entity`;
CREATE TABLE `js_sys_file_entity` (
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_md5` varchar(64) NOT NULL COMMENT '文件MD5',
  `file_path` varchar(1000) NOT NULL COMMENT '文件相对路径',
  `file_content_type` varchar(200) NOT NULL COMMENT '文件内容类型',
  `file_extension` varchar(100) NOT NULL COMMENT '文件后缀扩展名',
  `file_size` decimal(31,0) NOT NULL COMMENT '文件大小(单位B)',
  `file_meta` varchar(255) DEFAULT NULL COMMENT '文件信息(JSON格式)',
  PRIMARY KEY (`file_id`),
  KEY `idx_sys_file_entity_md5` (`file_md5`),
  KEY `idx_sys_file_entity_size` (`file_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件实体表';

-- ----------------------------
-- Records of js_sys_file_entity
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_file_upload`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_upload`;
CREATE TABLE `js_sys_file_upload` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_name` varchar(500) NOT NULL COMMENT '文件名称',
  `file_type` varchar(20) NOT NULL COMMENT '文件分类（image、media、file）',
  `file_sort` decimal(10,0) DEFAULT NULL COMMENT '文件排序（升序）',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_biz_ft` (`file_type`),
  KEY `idx_sys_file_biz_fi` (`file_id`),
  KEY `idx_sys_file_biz_status` (`status`),
  KEY `idx_sys_file_biz_cb` (`create_by`),
  KEY `idx_sys_file_biz_ud` (`update_date`),
  KEY `idx_sys_file_biz_bt` (`biz_type`),
  KEY `idx_sys_file_biz_bk` (`biz_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of js_sys_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job`;
CREATE TABLE `js_sys_job` (
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `description` varchar(100) NOT NULL COMMENT '任务描述',
  `invoke_target` varchar(1000) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) NOT NULL COMMENT 'Cron执行表达式',
  `misfire_instruction` decimal(1,0) NOT NULL COMMENT '计划执行错误策略',
  `concurrent` char(1) NOT NULL COMMENT '是否并发执行',
  `instance_name` varchar(64) NOT NULL DEFAULT 'JeeSiteScheduler' COMMENT '集群的实例名字',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2暂停）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_name`,`job_group`),
  KEY `idx_sys_job_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度表';

-- ----------------------------
-- Records of js_sys_job
-- ----------------------------
INSERT INTO `js_sys_job` VALUES ('MsgLocalMergePushTask', 'SYSTEM', '消息推送服务 (合并推送)', 'msgLocalMergePushTask.execute()', '0 0/30 * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null);
INSERT INTO `js_sys_job` VALUES ('MsgLocalPushTask', 'SYSTEM', '消息推送服务 (实时推送)', 'msgLocalPushTask.execute()', '0/3 * * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null);

-- ----------------------------
-- Table structure for `js_sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job_log`;
CREATE TABLE `js_sys_job_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_type` varchar(50) DEFAULT NULL COMMENT '日志类型',
  `job_event` varchar(200) DEFAULT NULL COMMENT '日志事件',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_job_log_jn` (`job_name`),
  KEY `idx_sys_job_log_jg` (`job_group`),
  KEY `idx_sys_job_log_t` (`job_type`),
  KEY `idx_sys_job_log_e` (`job_event`),
  KEY `idx_sys_job_log_ie` (`is_exception`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度日志表';

-- ----------------------------
-- Records of js_sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_lang`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_lang`;
CREATE TABLE `js_sys_lang` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) NOT NULL COMMENT '归属模块',
  `lang_code` varchar(500) NOT NULL COMMENT '语言编码',
  `lang_text` varchar(500) NOT NULL COMMENT '语言译文',
  `lang_type` varchar(50) NOT NULL COMMENT '语言类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_lang_code` (`lang_code`),
  KEY `idx_sys_lang_type` (`lang_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国际化语言';

-- ----------------------------
-- Records of js_sys_lang
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_log`;
CREATE TABLE `js_sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `log_title` varchar(500) NOT NULL COMMENT '日志标题',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_by_name` varchar(100) NOT NULL COMMENT '用户名称',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `request_uri` varchar(500) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_params` longtext COMMENT '操作提交的数据',
  `diff_modify_data` text COMMENT '新旧数据比较结果',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `remote_addr` varchar(255) NOT NULL COMMENT '操作IP地址',
  `server_addr` varchar(255) NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名称/操作系统',
  `browser_name` varchar(100) DEFAULT NULL COMMENT '浏览器名称',
  `execute_time` decimal(19,0) DEFAULT NULL COMMENT '执行时间',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_log_cb` (`create_by`),
  KEY `idx_sys_log_cc` (`corp_code`),
  KEY `idx_sys_log_lt` (`log_type`),
  KEY `idx_sys_log_bk` (`biz_key`),
  KEY `idx_sys_log_bt` (`biz_type`),
  KEY `idx_sys_log_ie` (`is_exception`),
  KEY `idx_sys_log_cd` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of js_sys_log
-- ----------------------------
INSERT INTO `js_sys_log` VALUES ('1186832538403667968', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-23 10:31:42', '/jeesite_web_war/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832602391969792', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-23 10:31:57', '/jeesite_web_war/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '180', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832605747412992', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-23 10:31:58', '/jeesite_web_war/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '326', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832614228295680', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-23 10:32:00', '/jeesite_web_war/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '966', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832619395678208', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-10-23 10:32:01', '/jeesite_web_war/a/sys/office/index', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '97', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832619919966208', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-23 10:32:02', '/jeesite_web_war/a/sys/office/list', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '43', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832621706739712', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-23 10:32:02', '/jeesite_web_war/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '41', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832631269752832', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-10-23 10:32:04', '/jeesite_web_war/a/sys/company/list', 'GET', '', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832632972640256', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-23 10:32:05', '/jeesite_web_war/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '69', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832648739028992', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:32:08', '/jeesite_web_war/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '99', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832649988931584', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:32:09', '/jeesite_web_war/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '166', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832669081403392', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:32:13', '/jeesite_web_war/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '38', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832669937041408', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:32:13', '/jeesite_web_war/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '64', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832683065212928', 'access', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-10-23 10:32:17', '/jeesite_web_war/a/sys/log/list', 'GET', '', null, '', 'Log', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '78', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832683841159168', 'select', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-10-23 10:32:17', '/jeesite_web_war/a/sys/log/listData', 'POST', 'logTitle=&requestUri=&logType=&createBy=&isException=&bizType=&bizKey=&createDate_gte=&createDate_lte=&remoteAddr=&pageNo=&pageSize=&orderBy=', null, '', 'Log', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '76', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832877467009024', 'access', '我的工作/文件管理', 'system', '超级管理员', '2019-10-23 10:33:03', '/jeesite_web_war/a/filemanager/index', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '150', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832877961936896', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:33:03', '/jeesite_web_war/a/filemanager/list', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '27', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832880214278144', 'select', '未知操作', 'system', '超级管理员', '2019-10-23 10:33:04', '/jeesite_web_war/a/filemanager/listData', 'POST', 'groupType=global&folderId=&sharedId=&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '203', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832892310650880', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:33:06', '/jeesite_web_war/a/filemanager/filemanagerShared/list', 'GET', '', null, '', 'FilemanagerShared', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '86', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832893594107904', 'select', '未知操作', 'system', '超级管理员', '2019-10-23 10:33:07', '/jeesite_web_war/a/filemanager/filemanagerShared/listData', 'POST', 'myShared=false&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, '', 'FilemanagerShared', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '164', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832933297389568', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-10-23 10:33:16', '/jeesite_web_war/a/sys/post/list', 'GET', '', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '77', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186832934626983936', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-10-23 10:33:17', '/jeesite_web_war/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '116', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833144958746624', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:34:07', '/jeesite_web_war/a/sys/user/info', 'GET', 'op=pwd', null, null, 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '101', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833220942757888', 'update', '未知操作', 'system', '超级管理员', '2019-10-23 10:34:25', '/jeesite_web_war/a/sys/user/infoSavePwd', 'POST', 'oldPassword=*&newPassword=*&confirmNewPassword=*', null, null, 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '87', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833221110530048', 'select', '未知操作', 'system', '超级管理员', '2019-10-23 10:34:25', '/jeesite_web_war/a/sys/user/info', 'GET', 'op=pwd', null, null, 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833277649747968', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:34:38', '/jeesite_web_war/a/sys/user/infoSavePwd', 'POST', 'oldPassword=*&newPassword=*&confirmNewPassword=*', null, null, 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833364287291392', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-10-23 10:34:59', '/jeesite_web_war/a/sys/office/index', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833364790607872', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-23 10:34:59', '/jeesite_web_war/a/sys/office/list', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '20', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833366103425024', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-23 10:34:59', '/jeesite_web_war/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833404850405376', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:35:09', '/jeesite_web_war/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833405580214272', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:35:09', '/jeesite_web_war/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833415067729920', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-23 10:35:11', '/jeesite_web_war/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '73', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833416049197056', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-23 10:35:11', '/jeesite_web_war/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '17', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833422189658112', 'access', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-23 10:35:13', '/jeesite_web_war/a/sys/corpAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '52', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833423452143616', 'select', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-23 10:35:13', '/jeesite_web_war/a/sys/corpAdmin/listData', 'POST', 'loginCode=&userName=&corpCode_=&corpName_=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833457996431360', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:35:21', '/jeesite_web_war/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833458709463040', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:35:22', '/jeesite_web_war/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '11', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833474710732800', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:35:25', '/jeesite_web_war/a/sys/menu/form', 'GET', 'menuCode=1186830414515068928', null, '1186830414515068928', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '86', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833532378218496', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-23 10:35:39', '/jeesite_web_war/a/sys/module/list', 'GET', '', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '71', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833533288382464', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-23 10:35:39', '/jeesite_web_war/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833540695523328', 'access', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-23 10:35:41', '/jeesite_web_war/a/sys/config/list', 'GET', '', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '37', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833541500829696', 'select', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-23 10:35:41', '/jeesite_web_war/a/sys/config/listData', 'POST', 'configName=&configKey_like=&isSys=&pageNo=&pageSize=&orderBy=', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833551244197888', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-10-23 10:35:44', '/jeesite_web_war/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '37', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833552175333376', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-10-23 10:35:44', '/jeesite_web_war/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833554452840448', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-23 10:35:44', '/jeesite_web_war/a/sys/area/list', 'GET', '', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '59', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833555459473408', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-23 10:35:45', '/jeesite_web_war/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '71', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833720937349120', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-10-23 10:36:24', '/jeesite_web_war/a/sys/online/list', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '48', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833721608437760', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-10-23 10:36:24', '/jeesite_web_war/a/sys/online/listData', 'POST', 'userCode=&!isAllOnline=0&!isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833798225788928', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 10:36:42', '/jeesite_web_war/a/test/testData/list', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '104', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833799274364928', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 10:36:43', '/jeesite_web_war/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '81', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833810368299008', 'access', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-23 10:36:45', '/jeesite_web_war/a/test/testTree/list', 'GET', '', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '51', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833811123273728', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-23 10:36:46', '/jeesite_web_war/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '40', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833822816993280', 'access', '系统管理/研发工具/表单组件实例/组件应用实例', 'system', '超级管理员', '2019-10-23 10:36:48', '/jeesite_web_war/a/demo/form/editForm', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '116', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833834447798272', 'access', '系统管理/研发工具/表单组件实例/栅格布局实例', 'system', '超级管理员', '2019-10-23 10:36:51', '/jeesite_web_war/a/demo/form/layoutForm', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186833843134201856', 'access', '系统管理/研发工具/表单组件实例/表格表单实例', 'system', '超级管理员', '2019-10-23 10:36:53', '/jeesite_web_war/a/demo/form/tableForm', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '25', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834139906375680', 'access', '我的工作/文件管理', 'system', '超级管理员', '2019-10-23 10:38:04', '/jeesite_web_war/a/filemanager/index', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834140594241536', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:04', '/jeesite_web_war/a/filemanager/list', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834141827366912', 'select', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:04', '/jeesite_web_war/a/filemanager/listData', 'POST', 'groupType=global&folderId=&sharedId=&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834143408619520', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:05', '/jeesite_web_war/a/filemanager/filemanagerShared/list', 'GET', '', null, '', 'FilemanagerShared', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834144209731584', 'select', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:05', '/jeesite_web_war/a/filemanager/filemanagerShared/listData', 'POST', 'myShared=false&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, '', 'FilemanagerShared', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '39', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834192393895936', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:16', '/jeesite_web_war/a/switchSkin/select', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834226791383040', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:25', '/jeesite_web_war/a/switchSkin/skin-blue-light2', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834245963546624', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:29', '/jeesite_web_war/a/switchSkin/select', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834254775779328', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:31', '/jeesite_web_war/a/switchSkin/skin-black', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '1', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834275889905664', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:36', '/jeesite_web_war/a/switchSkin/select', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834282584014848', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:38', '/jeesite_web_war/a/switchSkin/skin-red-light', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834297159221248', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:41', '/jeesite_web_war/a/switchSkin/select', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834305568800768', 'access', '未知操作', 'system', '超级管理员', '2019-10-23 10:38:43', '/jeesite_web_war/a/switchSkin/skin-purple-light', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '1', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834343443365888', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:38:52', '/jeesite_web_war/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834344236089344', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-23 10:38:53', '/jeesite_web_war/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834348023545856', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-23 10:38:54', '/jeesite_web_war/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834348837240832', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-23 10:38:54', '/jeesite_web_war/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834353283203072', 'access', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-23 10:38:55', '/jeesite_web_war/a/sys/corpAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834354033983488', 'select', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-23 10:38:55', '/jeesite_web_war/a/sys/corpAdmin/listData', 'POST', 'loginCode=&userName=&corpCode_=&corpName_=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '28', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834375030669312', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:39:00', '/jeesite_web_war/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834375970193408', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:39:00', '/jeesite_web_war/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834379694735360', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-23 10:39:01', '/jeesite_web_war/a/sys/module/list', 'GET', '', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834380550373376', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-23 10:39:01', '/jeesite_web_war/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '49', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834390918692864', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-23 10:39:04', '/jeesite_web_war/a/sys/module/form', 'GET', 'moduleCode=cms', null, 'cms', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834414465515520', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:39:09', '/jeesite_web_war/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830420882022400&parentid=0&n_level=0&_search=false&nd=1571798349358&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830420882022400', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834420496924672', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:39:11', '/jeesite_web_war/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830420949131264&parentid=1186830420882022400&n_level=1&_search=false&nd=1571798350805&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830420949131264', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834425504923648', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-23 10:39:12', '/jeesite_web_war/a/sys/menu/form', 'GET', 'menuCode=1186830421020434432', null, '1186830421020434432', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834445545308160', 'access', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-23 10:39:17', '/jeesite_web_war/a/sys/config/list', 'GET', '', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834446354808832', 'select', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-23 10:39:17', '/jeesite_web_war/a/sys/config/listData', 'POST', 'configName=&configKey_like=&isSys=&pageNo=&pageSize=&orderBy=', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '14', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834459143241728', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-10-23 10:39:20', '/jeesite_web_war/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834459919187968', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-10-23 10:39:20', '/jeesite_web_war/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '34', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834480588718080', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-23 10:39:25', '/jeesite_web_war/a/sys/area/list', 'GET', '', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834481704402944', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-23 10:39:25', '/jeesite_web_war/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834585794445312', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-10-23 10:39:50', '/jeesite_web_war/a/sys/online/list', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834586616528896', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-10-23 10:39:50', '/jeesite_web_war/a/sys/online/listData', 'POST', 'userCode=&!isAllOnline=0&!isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186834601405644800', 'access', '系统管理/系统监控/服务器监控', 'system', '超级管理员', '2019-10-23 10:39:54', '/jeesite_web_war/a/state/server/index', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '1122', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186840784447275008', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:04:28', '/jeesite_web_war/a/test/testData', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186840785672011776', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:04:28', '/jeesite_web_war/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186840801916551168', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:04:32', '/jeesite_web_war/a/test/testData/form', 'POST', '__layer=true', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '53', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186840996125409280', 'update', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:19', '/jeesite_web_war/a/test/testData/save', 'POST', 'id=&testInput=dsd&testTextarea=d&testSelect=1&!testSelectMultiple=&testSelectMultiple=1&testRadio=1&testCheckbox=1&!testCheckbox=&testDate=2019-10-23&testDatetime=2019-10-23 11:05&testUser.userName=用户07&testUser.userCode=user7_vcvr&testOffice.officeName=财务部&testOffice.officeCode=SDQD02&testAreaName=市南区&testAreaCode=370202&remarks=df&testData_image=&testData_image__del=&testData_file=&testData_file__del=&testDataChildList[0].status=0&testDataChildList[0].id=&testDataChildList[0].testSort=&testDataChildList[0].testData.id=&testDataChildList[0].testInput=&testDataChildList[0].testTextarea=&testDataChildList[0].testSelect=&!testDataChildList[0].testSelectMultiple=&testDataChildList[0].testRadio=&!testDataChildList[0].testCheckbox=&testDataChildList[0].testDate=&testDataChildList[0].testDatetime=&testDataChildList[0].testUser.userCode=&testDataChildList[0].testOffice.officeCode=&testDataChildList[0].testAreaName=&testDataChildList[0].testAreaCode=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '410', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186840996284792832', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:19', '/jeesite_web_war/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841025384873984', 'update', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:26', '/jeesite_web_war/a/test/testData/disable', 'POST', 'id=1186840995768893440', null, '1186840995768893440', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '69', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841025577811968', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:26', '/jeesite_web_war/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '17', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841040547282944', 'update', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:29', '/jeesite_web_war/a/test/testData/enable', 'POST', 'id=1186840995768893440', null, '1186840995768893440', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '117', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841040652140544', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:29', '/jeesite_web_war/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841058230468608', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:33', '/jeesite_web_war/a/test/testData/subListData', 'POST', 'testData.id=1186840995768893440&_search=false&nd=1571799933354&pageSize=-1&pageNo=1&orderBy=&sord=asc', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841066329669632', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:35', '/jeesite_web_war/a/test/testData/subListData', 'POST', 'testData.id=1186840995768893440&_search=false&nd=1571799935291&pageSize=-1&pageNo=1&orderBy=&sord=asc', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '11', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186841069722861568', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-23 11:05:36', '/jeesite_web_war/a/test/testData/form', 'POST', 'id=1186840995768893440&__layer=true', null, '1186840995768893440', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8080', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1186852257016377344', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-23 11:50:03', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172540492595200', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-24 09:02:45', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172620230508544', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-24 09:03:04', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '51', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172623615311872', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-24 09:03:05', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '611', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172628300349440', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-24 09:03:06', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '595', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172641835368448', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-24 09:03:09', '/js/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '53', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172643261431808', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-24 09:03:09', '/js/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '117', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172657752752128', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-24 09:03:13', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '67', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172658667110400', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-24 09:03:13', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '120', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172671694618624', 'access', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-10-24 09:03:16', '/js/a/sys/log/list', 'GET', '', null, '', 'Log', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '53', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172672466370560', 'select', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-10-24 09:03:16', '/js/a/sys/log/listData', 'POST', 'logTitle=&requestUri=&logType=&createBy=&isException=&bizType=&bizKey=&createDate_gte=&createDate_lte=&remoteAddr=&pageNo=&pageSize=&orderBy=', null, '', 'Log', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '103', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172695698620416', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-10-24 09:03:22', '/js/a/state/cache/index', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '48', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172696600395776', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-10-24 09:03:22', '/js/a/state/cache/cacheNameList', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172696684281856', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-10-24 09:03:22', '/js/a/state/cache/cacheKeyList', 'POST', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187172708193452032', 'access', '系统管理/系统监控/服务器监控', 'system', '超级管理员', '2019-10-24 09:03:25', '/js/a/state/server/index', 'GET', '', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '1110', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316520041955328', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-24 18:34:52', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316580850974720', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-24 18:35:07', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '120', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316583006846976', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-24 18:35:07', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '220', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316585200467968', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-24 18:35:08', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '276', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316594134335488', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-24 18:35:10', '/js/a/sys/empUser/form', 'GET', 'userCode=user22_n01o&op=edit', null, 'user22_n01o', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '329', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316613923061760', 'access', '未知操作', 'system', '超级管理员', '2019-10-24 18:35:15', '/js/a/sys/user/checkLoginCode', 'GET', 'oldLoginCode=user22&loginCode=user22', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316686492909568', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-24 18:35:32', '/js/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '99', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1187316687176581120', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-24 18:35:32', '/js/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '84', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188639622610636800', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-28 10:12:25', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188639658341912576', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 10:12:33', '/js/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '101', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188639660799774720', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 10:12:34', '/js/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '336', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650226730360832', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-28 10:54:33', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650253880090624', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-28 10:54:39', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '59', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650255054495744', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-28 10:54:40', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '208', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650258489630720', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-28 10:54:40', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '554', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650260322541568', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-10-28 10:54:41', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650260662280192', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-28 10:54:41', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '23', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650261748604928', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-28 10:54:41', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '43', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650266483974144', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-10-28 10:54:42', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '60', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650266974707712', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-28 10:54:42', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '37', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188650274516066304', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-28 10:54:44', '/js/a/sys/company/form', 'GET', 'companyCode=SD', null, 'SD', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '180', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188720879545999360', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-28 15:35:18', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188724409050927104', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-28 15:49:19', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728537383989248', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-28 16:05:43', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728558816882688', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:05:49', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '101', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728561580929024', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:05:49', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '461', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728594569129984', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:05:57', '/js/a/sys/menu/form', 'GET', 'menuCode=1186830414515068928', null, '1186830414515068928', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '224', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728628098396160', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:06:05', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830414515068928&parentid=0&n_level=0&_search=false&nd=1572249965021&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830414515068928', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '61', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728647232811008', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:06:10', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830415123243008&parentid=1186830414515068928&n_level=1&_search=false&nd=1572249969598&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830415123243008', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '46', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728662978228224', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:06:13', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830415219712000&parentid=1186830415123243008&n_level=2&_search=false&nd=1572249973349&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830415219712000', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '58', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188728793551106048', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:06:45', '/js/a/sys/menu/form', 'GET', 'menuCode=1186830415534284800', null, '1186830415534284800', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '46', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729108090351616', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:08:00', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1186830415966298112&parentid=1186830415123243008&n_level=2&_search=false&nd=1572250079479&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1186830415966298112', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '39', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729215468728320', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:08:25', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729485695152128', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-28 16:09:30', '/js/a/sys/module/list', 'GET', '', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '76', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729486643064832', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-28 16:09:30', '/js/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '71', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729496864583680', 'access', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-28 16:09:32', '/js/a/sys/config/list', 'GET', '', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '74', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729497430814720', 'select', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-28 16:09:32', '/js/a/sys/config/listData', 'POST', 'configName=&configKey_like=&isSys=&pageNo=&pageSize=&orderBy=', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729506901553152', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-10-28 16:09:35', '/js/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '60', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729507467784192', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-10-28 16:09:35', '/js/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '30', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729510965833728', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-28 16:09:36', '/js/a/sys/area/list', 'GET', '', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729511964078080', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-28 16:09:36', '/js/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '105', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729645259059200', 'access', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-10-28 16:10:08', '/js/a/gen/genTable/list', 'GET', '', null, '', 'GenTable', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '61', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729646362161152', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-10-28 16:10:08', '/js/a/gen/genTable/listData', 'POST', 'parentTableName_isNull=&tableName_like=&comments=&pageNo=&pageSize=&orderBy=', null, '', 'GenTable', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '172', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729663709802496', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-28 16:10:12', '/js/a/test/testData/list', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '85', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729664548663296', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-28 16:10:12', '/js/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '101', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729669191757824', 'access', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-28 16:10:13', '/js/a/test/testTree/list', 'GET', '', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '69', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729670122893312', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-28 16:10:14', '/js/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '98', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729682097631232', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-28 16:10:16', '/js/a/test/testData/subListData', 'POST', 'testData.id=1186840995768893440&_search=false&nd=1572250216296&pageSize=-1&pageNo=1&orderBy=&sord=asc', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '88', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729699990532096', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-28 16:10:21', '/js/a/test/testData/form', 'GET', 'id=1186840995861168128', null, '1186840995861168128', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '110', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729871977967616', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 16:11:02', '/js/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '72', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729872548392960', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 16:11:02', '/js/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729921219096576', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 16:11:13', '/js/a/sys/role/form', 'GET', 'op=add', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '61', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188729921923739648', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-28 16:11:14', '/js/a/sys/role/menuTreeData', 'POST', '___t=1572250273481&roleCode=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '90', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730237327011840', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-28 16:12:29', '/js/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '71', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730237993906176', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-28 16:12:29', '/js/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '17', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730242376953856', 'access', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-28 16:12:30', '/js/a/sys/corpAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '66', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730242783801344', 'select', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-28 16:12:30', '/js/a/sys/corpAdmin/listData', 'POST', 'loginCode=&userName=&corpCode_=&corpName_=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730267056238592', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-28 16:12:36', '/js/a/sys/area/list', 'GET', '', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730267794436096', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-28 16:12:36', '/js/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '14', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730285951578112', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:12:40', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '15', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188730286672998400', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-28 16:12:41', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1188731008646934528', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-28 16:15:33', '/js/a/test/testData/listData', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'Windows 7', 'Chrome 63', '28', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374353269968896', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 10:51:58', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374409070989312', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:52:11', '/js/a/test/testData/list', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '270', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374411411410944', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:52:12', '/js/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '370', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374862055874560', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 10:53:59', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374942469070848', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:18', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374957526622208', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:22', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189374960781402112', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:23', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375078385491968', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:51', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375084186214400', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:52', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '14', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375085469671424', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375086220451840', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375086958649344', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375087629737984', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375088267272192', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375089030635520', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '11', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375090116960256', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:54:54', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375463397433344', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:23', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375468069888000', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:24', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375469701472256', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:24', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375470624219136', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:24', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375471484051456', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375472234831872', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375472905920512', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375473732198400', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375474399092736', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '14', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375475024044032', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:25', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375475741270016', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:26', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375476605296640', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:26', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375477536432128', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:26', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375478673088512', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:26', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375480061403136', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:27', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375481089007616', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:27', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375482078863360', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:27', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189375504619053056', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 10:56:32', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376574242070528', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:48', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376580856487936', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:49', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376582542598144', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:49', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376583415013376', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:50', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376584165793792', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:50', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376584778162176', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:50', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376585453445120', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:50', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376586162282496', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:50', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376586917257216', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:00:51', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376645289385984', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:01:04', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376647705305088', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:01:05', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376648468668416', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:01:05', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376801250385920', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 11:01:42', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189376826248437760', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:01:48', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377057162022912', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 11:02:43', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377073079406592', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:02:46', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '38', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377099348332544', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:02:53', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377181321809920', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:03:12', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377186396917760', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:03:13', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189377374121381888', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:03:58', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '20', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189381031156011008', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:18:30', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189381036268867584', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:18:31', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189381399382347776', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:19:58', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382030033702912', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:22:28', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382448625242112', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:08', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '11', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382563641446400', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:35', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382575159005184', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:38', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382577725919232', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:39', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382579374280704', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:39', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382580221530112', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:39', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382580934561792', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:40', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382581655982080', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:40', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382607983628288', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:46', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382641374482432', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:54', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382644583124992', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:55', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382645992411136', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:55', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382646785134592', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:55', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382647628189696', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:24:56', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382672173256704', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:25:01', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382805745061888', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:25:33', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189382915568717824', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:25:59', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189383305823539200', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:27:32', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189383508651692032', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:28:21', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189390385599193088', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 11:55:40', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189390401843732480', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 11:55:44', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451037928919040', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 15:56:41', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451114047148032', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 15:56:59', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '82', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451115590651904', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-30 15:57:00', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '301', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451119407468544', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 15:57:00', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '598', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451124415467520', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-10-30 15:57:02', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451125325631488', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:02', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451126013497344', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:02', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '40', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451160973021184', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:10', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=SDJN&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, 'SDJN', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '70', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451161270816768', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:10', '/js/a/sys/office/listData', 'POST', 'id=&nodeid=SDJN&parentid=SD&n_level=1&_search=false&nd=1572422230394&pageSize=&pageNo=&orderBy=&sord=asc&ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&parentCode=SDJN', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '35', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451167054761984', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:12', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=SDJN01&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, 'SDJN01', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451171899183104', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:13', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=SDJN02&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, 'SDJN02', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451185849438208', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:16', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=SDJN03&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, 'SDJN03', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '52', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451195697664000', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 15:57:19', '/js/a/sys/office/form', 'GET', 'officeCode=SDJN03', null, 'SDJN03', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '84', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451302891491328', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-10-30 15:57:44', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '62', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451303411585024', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-30 15:57:44', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '41', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451318204895232', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-30 15:57:48', '/js/a/sys/company/form', 'GET', 'companyCode=SD', null, 'SD', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '145', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451417274355712', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-10-30 15:58:11', '/js/a/sys/post/list', 'GET', '', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451417865752576', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-10-30 15:58:12', '/js/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '64', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451424782159872', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-10-30 15:58:13', '/js/a/sys/post/form', 'GET', 'postCode=ceo', null, 'ceo', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '49', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189451431203639296', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-10-30 15:58:15', '/js/a/sys/post/checkPostName', 'GET', 'oldPostName=总经理&postName=总经理', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189457392521777152', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-10-30 16:21:56', '/js/a/sys/post/form', 'GET', 'postCode=ceo', null, 'ceo', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '68', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189457411337424896', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-10-30 16:22:01', '/js/a/sys/post/checkPostName', 'GET', 'oldPostName=总经理&postName=总经理', null, '', 'Post', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '9', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458264370778112', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:25:24', '/js/a/test/testData/vue', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '35', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458394410979328', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:25:55', '/js/a/test/testData/list', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '102', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458395434389504', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:25:55', '/js/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458410185756672', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:25:59', '/js/a/test/testData/form', 'POST', '__layer=true', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '63', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458491827884032', 'update', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:26:18', '/js/a/test/testData/transTest', 'POST', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '671', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458492113096704', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:26:18', '/js/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '28', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458523306135552', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:26:26', '/js/a/test/testData/form', 'POST', 'id=1186840995768893440&__layer=true', null, '1186840995768893440', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '73', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458788478423040', 'access', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:27:29', '/js/a/test/testTree/list', 'GET', '', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458789753491456', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:27:29', '/js/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '99', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458811761004544', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:27:34', '/js/a/test/testTree/form', 'POST', '__layer=true', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '62', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458880274960384', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:27:51', '/js/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458893814173696', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:27:54', '/js/a/test/testTree/form', 'POST', '__layer=true', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458941700542464', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:05', '/js/a/test/testTree/createNextNode', 'GET', 'parentCode=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458980669820928', 'update', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:15', '/js/a/test/testTree/save', 'POST', 'parent.treeName=&parent.id=&isNewRecord=true&treeCode=1&treeName=1&treeSort=30&remarks=1&testTree_image=&testTree_image__del=&testTree_file=&testTree_file__del=', null, '1', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '539', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189458980871147520', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:15', '/js/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459008494833664', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:21', '/js/a/test/testTree/form', 'POST', '__layer=true', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459025406267392', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:25', '/js/a/test/testTree/createNextNode', 'GET', 'parentCode=1', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459071958847488', 'update', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:36', '/js/a/test/testTree/save', 'POST', 'parent.treeName=1&parent.id=1&isNewRecord=true&treeCode=2&treeName=2&treeSort=30&remarks=2&testTree_image=&testTree_image__del=&testTree_file=&testTree_file__del=', null, '2', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '422', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459072105648128', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:28:37', '/js/a/test/testTree/listData', 'POST', 'id=&nodeid=1&parentid=0&n_level=0&_search=false&nd=1572424116507&pageSize=&pageNo=&orderBy=&sord=asc&treeName=&remarks=&status=&parentCode=1', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '10', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459336338411520', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-30 16:29:40', '/js/a/sys/module/list', 'GET', '', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '61', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459337013694464', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-30 16:29:40', '/js/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459352046080000', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 16:29:43', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459352457121792', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-30 16:29:43', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '15', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459353405034496', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 16:29:44', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459369540521984', 'access', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-10-30 16:29:47', '/js/a/gen/genTable/list', 'GET', '', null, '', 'GenTable', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '67', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459370974973952', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-10-30 16:29:48', '/js/a/gen/genTable/listData', 'POST', 'parentTableName_isNull=&tableName_like=&comments=&pageNo=&pageSize=&orderBy=', null, '', 'GenTable', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '261', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459401832468480', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-10-30 16:29:55', '/js/a/gen/genTable/form', 'GET', 'tableName=test_data', null, 'test_data', 'GenTable', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '901', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459458891780096', 'access', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:30:09', '/js/a/test/testData/list', 'GET', '', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459459416068096', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:30:09', '/js/a/test/testData/listData', 'POST', 'testInput=&testTextarea=&testSelect=&!testSelectMultiple=&!testCheckbox=&testDate_gte=&testDate_lte=&testDatetime_gte=&testDatetime_lte=&testUser.userName=&testUser.userCode=&testOffice.officeName=&testOffice.officeCode=&testAreaName=&testAreaCode=&status=&remarks=&pageNo=&pageSize=&orderBy=', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459462574379008', 'access', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:30:10', '/js/a/test/testTree/list', 'GET', '', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459463077695488', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:30:10', '/js/a/test/testTree/listData', 'POST', 'treeName=&remarks=&status=&pageNo=&pageSize=&orderBy=', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459512381739008', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:30:21', '/js/a/test/testTree/form', 'GET', '', null, '', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '27', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189459553968263168', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:30:31', '/js/a/test/testData/form', 'GET', 'id=1186840995768893440', null, '1186840995768893440', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '37', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189460134971641856', 'select', '系统管理/研发工具/代码生成实例/树表_树结构表', 'system', '超级管理员', '2019-10-30 16:32:50', '/js/a/test/testTree/form', 'GET', 'treeCode=1', null, '1', 'TestTree', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '27', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189460148867371008', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:32:53', '/js/a/test/testData/subListData', 'POST', 'testData.id=1186840995768893440&_search=false&nd=1572424373159&pageSize=-1&pageNo=1&orderBy=&sord=asc', null, '', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '62', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189460159642537984', 'select', '系统管理/研发工具/代码生成实例/单表_主子表', 'system', '超级管理员', '2019-10-30 16:32:56', '/js/a/test/testData/form', 'GET', 'id=1186840995861168128', null, '1186840995861168128', 'TestData', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '15', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479799222235136', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-10-30 17:50:58', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479824673271808', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 17:51:04', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '87', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479826317438976', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-10-30 17:51:05', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '238', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479827156299776', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-10-30 17:51:05', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '25', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479828234235904', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 17:51:05', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479828427173888', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-10-30 17:51:05', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '242', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479829307977728', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-10-30 17:51:05', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '33', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479831610650624', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-10-30 17:51:06', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '62', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479832160104448', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-10-30 17:51:06', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479863286034432', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-30 17:51:14', '/js/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479864141672448', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-10-30 17:51:14', '/js/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479867471949824', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-30 17:51:15', '/js/a/sys/role/list', 'GET', '', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479869552324608', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-10-30 17:51:15', '/js/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '294', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479880763699200', 'access', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-30 17:51:18', '/js/a/sys/corpAdmin/list', 'GET', '', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '39', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479881120215040', 'select', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-10-30 17:51:18', '/js/a/sys/corpAdmin/listData', 'POST', 'loginCode=&userName=&corpCode_=&corpName_=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479907913428992', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-30 17:51:24', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479908496437248', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-30 17:51:24', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '53', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479915287015424', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-30 17:51:26', '/js/a/sys/module/list', 'GET', '', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '31', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189479915727417344', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-10-30 17:51:26', '/js/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '32', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480067422810112', 'access', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-30 17:52:02', '/js/a/sys/config/list', 'GET', '', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480067942903808', 'select', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-10-30 17:52:02', '/js/a/sys/config/listData', 'POST', 'configName=&configKey_like=&isSys=&pageNo=&pageSize=&orderBy=', null, '', 'Config', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480071612919808', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-10-30 17:52:03', '/js/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '34', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480072552443904', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-10-30 17:52:03', '/js/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480077556248576', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-30 17:52:05', '/js/a/sys/area/list', 'GET', '', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '79', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480078046982144', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-10-30 17:52:05', '/js/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '38', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480311095095296', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-30 17:53:00', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '23', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1189480311539691520', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-10-30 17:53:00', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '0:0:0:0:0:0:0:1', 'http://localhost:8980', '0', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'Windows 7', 'Chrome', '13', '0', 'JeeSite');

-- ----------------------------
-- Table structure for `js_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_menu`;
CREATE TABLE `js_sys_menu` (
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `menu_name` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) NOT NULL COMMENT '菜单类型（1菜单 2权限 3开发）',
  `menu_href` varchar(1000) DEFAULT NULL COMMENT '链接',
  `menu_target` varchar(20) DEFAULT NULL COMMENT '目标',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `menu_title` varchar(100) DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(1000) DEFAULT NULL COMMENT '权限标识',
  `weight` decimal(4,0) DEFAULT NULL COMMENT '菜单权重',
  `is_show` char(1) NOT NULL COMMENT '是否显示（1显示 0隐藏）',
  `sys_code` varchar(64) NOT NULL COMMENT '归属系统（default:主导航菜单、mobileApp:APP菜单）',
  `module_codes` varchar(500) NOT NULL COMMENT '归属模块（多个用逗号隔开）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`menu_code`),
  KEY `idx_sys_menu_pc` (`parent_code`),
  KEY `idx_sys_menu_ts` (`tree_sort`),
  KEY `idx_sys_menu_status` (`status`),
  KEY `idx_sys_menu_mt` (`menu_type`),
  KEY `idx_sys_menu_pss` (`parent_codes`),
  KEY `idx_sys_menu_tss` (`tree_sorts`),
  KEY `idx_sys_menu_sc` (`sys_code`),
  KEY `idx_sys_menu_is` (`is_show`),
  KEY `idx_sys_menu_mcs` (`module_codes`),
  KEY `idx_sys_menu_wt` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of js_sys_menu
-- ----------------------------
INSERT INTO `js_sys_menu` VALUES ('1186830414515068928', '0', '0,', '9000', '0000009000,', '0', '0', '系统管理', '系统管理', '1', '', '', 'icon-settings', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415123243008', '1186830414515068928', '0,1186830414515068928,', '300', '0000009000,0000000300,', '0', '1', '系统管理/组织管理', '组织管理', '1', '', '', 'icon-grid', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415219712000', '1186830415123243008', '0,1186830414515068928,1186830415123243008,', '40', '0000009000,0000000300,0000000040,', '0', '2', '系统管理/组织管理/用户管理', '用户管理', '1', '/sys/empUser/index', '', 'icon-user', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415316180992', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '30', '0000009000,0000000300,0000000040,0000000030,', '1', '3', '系统管理/组织管理/用户管理/查看', '查看', '2', '', '', '', '', null, 'sys:empUser:view', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415429427200', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '40', '0000009000,0000000300,0000000040,0000000040,', '1', '3', '系统管理/组织管理/用户管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:empUser:edit', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415534284800', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/分配角色', '分配角色', '2', '', '', '', '', null, 'sys:empUser:authRole', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415655919616', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '50', '0000009000,0000000300,0000000040,0000000050,', '1', '3', '系统管理/组织管理/用户管理/分配数据', '分配数据', '2', '', '', '', '', null, 'sys:empUser:authDataScope', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415752388608', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/停用启用', '停用启用', '2', '', '', '', '', null, 'sys:empUser:updateStatus', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415874023424', '1186830415219712000', '0,1186830414515068928,1186830415123243008,1186830415219712000,', '70', '0000009000,0000000300,0000000040,0000000070,', '1', '3', '系统管理/组织管理/用户管理/重置密码', '重置密码', '2', '', '', '', '', null, 'sys:empUser:resetpwd', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830415966298112', '1186830415123243008', '0,1186830414515068928,1186830415123243008,', '50', '0000009000,0000000300,0000000050,', '0', '2', '系统管理/组织管理/机构管理', '机构管理', '1', '/sys/office/index', '', 'icon-grid', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416037601280', '1186830415966298112', '0,1186830414515068928,1186830415123243008,1186830415966298112,', '30', '0000009000,0000000300,0000000050,0000000030,', '1', '3', '系统管理/组织管理/机构管理/查看', '查看', '2', '', '', '', '', null, 'sys:office:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416142458880', '1186830415966298112', '0,1186830414515068928,1186830415123243008,1186830415966298112,', '40', '0000009000,0000000300,0000000050,0000000040,', '1', '3', '系统管理/组织管理/机构管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:office:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416234733568', '1186830415123243008', '0,1186830414515068928,1186830415123243008,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/公司管理', '公司管理', '1', '/sys/company/list', '', 'icon-fire', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416318619648', '1186830416234733568', '0,1186830414515068928,1186830415123243008,1186830416234733568,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/公司管理/查看', '查看', '2', '', '', '', '', null, 'sys:company:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416528334848', '1186830416234733568', '0,1186830414515068928,1186830415123243008,1186830416234733568,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/公司管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:company:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416608026624', '1186830415123243008', '0,1186830414515068928,1186830415123243008,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/岗位管理', '岗位管理', '1', '/sys/post/list', '', 'icon-trophy', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416700301312', '1186830416608026624', '0,1186830414515068928,1186830415123243008,1186830416608026624,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/岗位管理/查看', '查看', '2', '', '', '', '', null, 'sys:post:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416796770304', '1186830416608026624', '0,1186830414515068928,1186830415123243008,1186830416608026624,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/岗位管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:post:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416880656384', '1186830414515068928', '0,1186830414515068928,', '400', '0000009000,0000000400,', '0', '1', '系统管理/权限管理', '权限管理', '1', '', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830416972931072', '1186830416880656384', '0,1186830414515068928,1186830416880656384,', '30', '0000009000,0000000400,0000000030,', '1', '2', '系统管理/权限管理/角色管理', '角色管理', '1', '/sys/role/list', '', 'icon-people', '', null, 'sys:role', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417061011456', '1186830416880656384', '0,1186830414515068928,1186830416880656384,', '40', '0000009000,0000000400,0000000040,', '1', '2', '系统管理/权限管理/二级管理员', '二级管理员', '1', '/sys/secAdmin/list', '', 'icon-user-female', '', null, 'sys:secAdmin', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417144897536', '1186830416880656384', '0,1186830414515068928,1186830416880656384,', '50', '0000009000,0000000400,0000000050,', '1', '2', '系统管理/权限管理/系统管理员', '系统管理员', '1', '/sys/corpAdmin/list', '', 'icon-badge', '', null, 'sys:corpAdmin', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417228783616', '1186830414515068928', '0,1186830414515068928,', '500', '0000009000,0000000500,', '0', '1', '系统管理/系统设置', '系统设置', '1', '', '', 'icon-settings', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417316864000', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '30', '0000009000,0000000500,0000000030,', '1', '2', '系统管理/系统设置/菜单管理', '菜单管理', '1', '/sys/menu/list', '', 'icon-book-open', '', null, 'sys:menu', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417396555776', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '40', '0000009000,0000000500,0000000040,', '1', '2', '系统管理/系统设置/模块管理', '模块管理', '1', '/sys/module/list', '', 'icon-grid', '', null, 'sys:module', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417480441856', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '50', '0000009000,0000000500,0000000050,', '1', '2', '系统管理/系统设置/参数设置', '参数设置', '1', '/sys/config/list', '', 'icon-wrench', '', null, 'sys:config', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417560133632', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '60', '0000009000,0000000500,0000000060,', '0', '2', '系统管理/系统设置/字典管理', '字典管理', '1', '/sys/dictType/list', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417639825408', '1186830417560133632', '0,1186830414515068928,1186830417228783616,1186830417560133632,', '30', '0000009000,0000000500,0000000060,0000000030,', '1', '3', '系统管理/系统设置/字典管理/类型查看', '类型查看', '2', '', '', '', '', null, 'sys:dictType:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417723711488', '1186830417560133632', '0,1186830414515068928,1186830417228783616,1186830417560133632,', '40', '0000009000,0000000500,0000000060,0000000040,', '1', '3', '系统管理/系统设置/字典管理/类型编辑', '类型编辑', '2', '', '', '', '', null, 'sys:dictType:edit', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:16', 'system', '2019-10-23 10:23:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417811791872', '1186830417560133632', '0,1186830414515068928,1186830417228783616,1186830417560133632,', '50', '0000009000,0000000500,0000000060,0000000050,', '1', '3', '系统管理/系统设置/字典管理/数据查看', '数据查看', '2', '', '', '', '', null, 'sys:dictData:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417891483648', '1186830417560133632', '0,1186830414515068928,1186830417228783616,1186830417560133632,', '60', '0000009000,0000000500,0000000060,0000000060,', '1', '3', '系统管理/系统设置/字典管理/数据编辑', '数据编辑', '2', '', '', '', '', null, 'sys:dictData:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830417971175424', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '70', '0000009000,0000000500,0000000070,', '1', '2', '系统管理/系统设置/行政区划', '行政区划', '1', '/sys/area/list', '', 'icon-map', '', null, 'sys:area', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418055061504', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '80', '0000009000,0000000500,0000000080,', '1', '2', '系统管理/系统设置/国际化管理', '国际化管理', '1', '/sys/lang/list', '', 'icon-globe', '', null, 'sys:lang', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418134753280', '1186830417228783616', '0,1186830414515068928,1186830417228783616,', '90', '0000009000,0000000500,0000000090,', '1', '2', '系统管理/系统设置/产品许可信息', '产品许可信息', '1', '//licence', '', 'icon-paper-plane', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418227027968', '1186830414515068928', '0,1186830414515068928,', '600', '0000009000,0000000600,', '0', '1', '系统管理/系统监控', '系统监控', '1', '', '', 'icon-ghost', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418315108352', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '40', '0000009000,0000000600,0000000040,', '1', '2', '系统管理/系统监控/访问日志', '访问日志', '1', '/sys/log/list', '', 'fa fa-bug', '', null, 'sys:log', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418403188736', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '50', '0000009000,0000000600,0000000050,', '1', '2', '系统管理/系统监控/数据监控', '数据监控', '1', '//druid/index.html', '', 'icon-disc', '', null, 'sys:state:druid', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418487074816', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '60', '0000009000,0000000600,0000000060,', '1', '2', '系统管理/系统监控/缓存监控', '缓存监控', '1', '/state/cache/index', '', 'icon-social-dribbble', '', null, 'sys:stste:cache', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418600321024', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '70', '0000009000,0000000600,0000000070,', '1', '2', '系统管理/系统监控/服务器监控', '服务器监控', '1', '/state/server/index', '', 'icon-speedometer', '', null, 'sys:state:server', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418675818496', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '80', '0000009000,0000000600,0000000080,', '1', '2', '系统管理/系统监控/作业监控', '作业监控', '1', '/job/list', '', 'icon-notebook', '', null, 'sys:job', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418755510272', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '90', '0000009000,0000000600,0000000090,', '1', '2', '系统管理/系统监控/在线用户', '在线用户', '1', '/sys/online/list', '', 'icon-social-twitter', '', null, 'sys:online', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418839396352', '1186830418227027968', '0,1186830414515068928,1186830418227027968,', '100', '0000009000,0000000600,0000000100,', '1', '2', '系统管理/系统监控/在线文档', '在线文档', '1', '//swagger-ui.html', '', 'icon-book-open', '', null, 'sys:swagger', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418914893824', '1186830414515068928', '0,1186830414515068928,', '700', '0000009000,0000000700,', '0', '1', '系统管理/消息推送', '消息推送', '1', '', '', 'icon-envelope-letter', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830418990391296', '1186830418914893824', '0,1186830414515068928,1186830418914893824,', '30', '0000009000,0000000700,0000000030,', '1', '2', '系统管理/消息推送/未完成消息', '未完成消息', '1', '/msg/msgPush/list', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419082665984', '1186830418914893824', '0,1186830414515068928,1186830418914893824,', '40', '0000009000,0000000700,0000000040,', '1', '2', '系统管理/消息推送/已完成消息', '已完成消息', '1', '/msg/msgPush/list?pushed=true', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419229466624', '1186830418914893824', '0,1186830414515068928,1186830418914893824,', '50', '0000009000,0000000700,0000000050,', '1', '2', '系统管理/消息推送/消息模板管理', '消息模板管理', '1', '/msg/msgTemplate/list', '', '', '', null, 'msg:msgTemplate', '60', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419321741312', '1186830414515068928', '0,1186830414515068928,', '900', '0000009000,0000000900,', '0', '1', '系统管理/研发工具', '研发工具', '1', '', '', 'fa fa-code', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419405627392', '1186830419321741312', '0,1186830414515068928,1186830419321741312,', '30', '0000009000,0000000900,0000000030,', '1', '2', '系统管理/研发工具/代码生成工具', '代码生成工具', '1', '/gen/genTable/list', '', 'fa fa-code', '', null, 'gen:genTable', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419481124864', '1186830419321741312', '0,1186830414515068928,1186830419321741312,', '100', '0000009000,0000000900,0000000100,', '0', '2', '系统管理/研发工具/代码生成实例', '代码生成实例', '1', '', '', 'icon-social-dropbox', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419552428032', '1186830419481124864', '0,1186830414515068928,1186830419321741312,1186830419481124864,', '30', '0000009000,0000000900,0000000100,0000000030,', '1', '3', '系统管理/研发工具/代码生成实例/单表_主子表', '单表/主子表', '1', '/test/testData/list', '', '', '', null, 'test:testData', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419648897024', '1186830419481124864', '0,1186830414515068928,1186830419321741312,1186830419481124864,', '40', '0000009000,0000000900,0000000100,0000000040,', '1', '3', '系统管理/研发工具/代码生成实例/树表_树结构表', '树表/树结构表', '1', '/test/testTree/list', '', '', '', null, 'test:testTree', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419720200192', '1186830419321741312', '0,1186830414515068928,1186830419321741312,', '200', '0000009000,0000000900,0000000200,', '0', '2', '系统管理/研发工具/数据表格实例', '数据表格实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419804086272', '1186830419720200192', '0,1186830414515068928,1186830419321741312,1186830419720200192,', '30', '0000009000,0000000900,0000000200,0000000030,', '1', '3', '系统管理/研发工具/数据表格实例/多表头分组小计合计', '多表头分组小计合计', '1', '/demo/dataGrid/groupGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830419883778048', '1186830419720200192', '0,1186830414515068928,1186830419321741312,1186830419720200192,', '40', '0000009000,0000000900,0000000200,0000000040,', '1', '3', '系统管理/研发工具/数据表格实例/编辑表格多行编辑', '编辑表格多行编辑', '1', '/demo/dataGrid/editGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420005412864', '1186830419321741312', '0,1186830414515068928,1186830419321741312,', '300', '0000009000,0000000900,0000000300,', '0', '2', '系统管理/研发工具/表单组件实例', '表单组件实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420097687552', '1186830420005412864', '0,1186830414515068928,1186830419321741312,1186830420005412864,', '30', '0000009000,0000000900,0000000300,0000000030,', '1', '3', '系统管理/研发工具/表单组件实例/组件应用实例', '组件应用实例', '1', '/demo/form/editForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420173185024', '1186830420005412864', '0,1186830414515068928,1186830419321741312,1186830420005412864,', '40', '0000009000,0000000900,0000000300,0000000040,', '1', '3', '系统管理/研发工具/表单组件实例/栅格布局实例', '栅格布局实例', '1', '/demo/form/layoutForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420252876800', '1186830420005412864', '0,1186830414515068928,1186830419321741312,1186830420005412864,', '50', '0000009000,0000000900,0000000300,0000000050,', '1', '3', '系统管理/研发工具/表单组件实例/表格表单实例', '表格表单实例', '1', '/demo/form/tableForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420332568576', '1186830419321741312', '0,1186830414515068928,1186830419321741312,', '400', '0000009000,0000000900,0000000400,', '0', '2', '系统管理/研发工具/前端界面实例', '前端界面实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420412260352', '1186830420332568576', '0,1186830414515068928,1186830419321741312,1186830420332568576,', '30', '0000009000,0000000900,0000000400,0000000030,', '1', '3', '系统管理/研发工具/前端界面实例/图标样式查找', '图标样式查找', '1', '//tags/iconselect', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420483563520', '1186830414515068928', '0,1186830414515068928,', '999', '0000009000,0000000999,', '0', '1', '系统管理/JeeSite社区', 'JeeSite社区', '1', '', '', 'icon-directions', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420563255296', '1186830420483563520', '0,1186830414515068928,1186830420483563520,', '30', '0000009000,0000000999,0000000030,', '1', '2', '系统管理/JeeSite社区/官方网站', '官方网站', '1', 'http://jeesite.com', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420642947072', '1186830420483563520', '0,1186830414515068928,1186830420483563520,', '50', '0000009000,0000000999,0000000050,', '1', '2', '系统管理/JeeSite社区/作者博客', '作者博客', '1', 'https://my.oschina.net/thinkgem', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420726833152', '1186830420483563520', '0,1186830414515068928,1186830420483563520,', '40', '0000009000,0000000999,0000000040,', '1', '2', '系统管理/JeeSite社区/问题反馈', '问题反馈', '1', 'https://gitee.com/thinkgem/jeesite4/issues', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420802330624', '1186830420483563520', '0,1186830414515068928,1186830420483563520,', '60', '0000009000,0000000999,0000000060,', '1', '2', '系统管理/JeeSite社区/开源社区', '开源社区', '1', 'http://jeesite.net', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420882022400', '0', '0,', '9060', '0000009060,', '0', '0', '我的工作', '我的工作', '1', '', '', 'icon-screen-desktop', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830420949131264', '1186830420882022400', '0,1186830420882022400,', '500', '0000009060,0000000500,', '0', '1', '我的工作/文件管理', '文件管理', '1', '', '', 'icon-folder', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421020434432', '1186830420949131264', '0,1186830420882022400,1186830420949131264,', '30', '0000009060,0000000500,0000000030,', '1', '2', '我的工作/文件管理/文件管理', '文件管理', '1', '/filemanager/index', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421095931904', '1186830420949131264', '0,1186830420882022400,1186830420949131264,', '50', '0000009060,0000000500,0000000050,', '1', '2', '我的工作/文件管理/文件分享', '文件分享', '1', '/filemanager/filemanagerShared/list', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421192400896', '1186830420882022400', '0,1186830420882022400,', '600', '0000009060,0000000600,', '0', '1', '我的工作/站内消息', '站内消息', '1', '/msg/msgInner/list', '', 'icon-speech', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421263704064', '1186830421192400896', '0,1186830420882022400,1186830421192400896,', '30', '0000009060,0000000600,0000000030,', '1', '2', '我的工作/站内消息/查看', '查看', '2', '', '', '', '', null, 'msg:msgInner:view', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421347590144', '1186830421192400896', '0,1186830420882022400,1186830421192400896,', '40', '0000009060,0000000600,0000000040,', '1', '2', '我的工作/站内消息/编辑', '编辑', '2', '', '', '', '', null, 'msg:msgInner:edit', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186830421427281920', '1186830421192400896', '0,1186830420882022400,1186830421192400896,', '50', '0000009060,0000000600,0000000050,', '1', '2', '我的工作/站内消息/审核', '审核', '2', '', '', '', '', null, 'msg:msgInner:auth', '40', '1', 'default', 'core', '0', 'system', '2019-10-23 10:23:17', 'system', '2019-10-23 10:23:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_module`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_module`;
CREATE TABLE `js_sys_module` (
  `module_code` varchar(64) NOT NULL COMMENT '模块编码',
  `module_name` varchar(100) NOT NULL COMMENT '模块名称',
  `description` varchar(500) DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) DEFAULT NULL COMMENT '升级信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`module_code`),
  KEY `idx_sys_module_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of js_sys_module
-- ----------------------------
INSERT INTO `js_sys_module` VALUES ('cms', '内容管理', '网站、站点、栏目、文章、链接、评论、留言板', 'com.jeesite.modules.cms.web.CmsController', '4.0.0', null, '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:23:11', null);
INSERT INTO `js_sys_module` VALUES ('core', '核心模块', '用户、角色、组织、模块、菜单、字典、参数', 'com.jeesite.modules.sys.web.LoginController', '4.1.7', null, '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:23:11', null);
INSERT INTO `js_sys_module` VALUES ('filemanager', '文件管理', '公共文件柜、个人文件柜、文件分享', 'com.jeesite.modules.filemanager.web.FilemanagerController', '4.1.6', 'upgrade 2019-10-23 10:30:50 (4.1.5 -> 4.1.6)', '0', 'system', '2019-10-23 10:23:11', 'system', '2019-10-23 10:30:51', null);

-- ----------------------------
-- Table structure for `js_sys_msg_inner`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner`;
CREATE TABLE `js_sys_msg_inner` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `content_level` char(1) NOT NULL COMMENT '内容级别（1普通 2一般 3紧急）',
  `content_type` char(1) DEFAULT NULL COMMENT '内容类型（1公告 2新闻 3会议 4其它）',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `receive_type` char(1) NOT NULL COMMENT '接受者类型（0全部 1用户 2部门 3角色 4岗位）',
  `receive_codes` text COMMENT '接受者字符串',
  `receive_names` text COMMENT '接受者名称字符串',
  `send_user_code` varchar(64) DEFAULT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) DEFAULT NULL COMMENT '发送者用户姓名',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `is_attac` char(1) DEFAULT NULL COMMENT '是否有附件',
  `notify_types` varchar(100) DEFAULT NULL COMMENT '通知类型（PC APP 短信 邮件 微信）多选',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 4审核 5驳回 9草稿）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_cb` (`create_by`),
  KEY `idx_sys_msg_inner_status` (`status`),
  KEY `idx_sys_msg_inner_cl` (`content_level`),
  KEY `idx_sys_msg_inner_sc` (`send_user_code`),
  KEY `idx_sys_msg_inner_sd` (`send_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息';

-- ----------------------------
-- Records of js_sys_msg_inner
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_msg_inner_record`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner_record`;
CREATE TABLE `js_sys_msg_inner_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_inner_id` varchar(64) NOT NULL COMMENT '所属消息',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `read_status` char(1) NOT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '阅读时间',
  `is_star` char(1) DEFAULT NULL COMMENT '是否标星',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_r_mi` (`msg_inner_id`),
  KEY `idx_sys_msg_inner_r_ruc` (`receive_user_code`),
  KEY `idx_sys_msg_inner_r_status` (`read_status`),
  KEY `idx_sys_msg_inner_r_star` (`is_star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息发送记录表';

-- ----------------------------
-- Records of js_sys_msg_inner_record
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_msg_push`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push`;
CREATE TABLE `js_sys_msg_push` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_push_type` (`msg_type`),
  KEY `idx_sys_msg_push_rc` (`receive_code`),
  KEY `idx_sys_msg_push_uc` (`receive_user_code`),
  KEY `idx_sys_msg_push_suc` (`send_user_code`),
  KEY `idx_sys_msg_push_pd` (`plan_push_date`),
  KEY `idx_sys_msg_push_ps` (`push_status`),
  KEY `idx_sys_msg_push_rs` (`read_status`),
  KEY `idx_sys_msg_push_bk` (`biz_key`),
  KEY `idx_sys_msg_push_bt` (`biz_type`),
  KEY `idx_sys_msg_push_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送表';

-- ----------------------------
-- Records of js_sys_msg_push
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_msg_pushed`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_pushed`;
CREATE TABLE `js_sys_msg_pushed` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_pushed_type` (`msg_type`),
  KEY `idx_sys_msg_pushed_rc` (`receive_code`),
  KEY `idx_sys_msg_pushed_uc` (`receive_user_code`),
  KEY `idx_sys_msg_pushed_suc` (`send_user_code`),
  KEY `idx_sys_msg_pushed_pd` (`plan_push_date`),
  KEY `idx_sys_msg_pushed_ps` (`push_status`),
  KEY `idx_sys_msg_pushed_rs` (`read_status`),
  KEY `idx_sys_msg_pushed_bk` (`biz_key`),
  KEY `idx_sys_msg_pushed_bt` (`biz_type`),
  KEY `idx_sys_msg_pushed_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息已推送表';

-- ----------------------------
-- Records of js_sys_msg_pushed
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_msg_template`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_template`;
CREATE TABLE `js_sys_msg_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) DEFAULT NULL COMMENT '归属模块',
  `tpl_key` varchar(100) NOT NULL COMMENT '模板键值',
  `tpl_name` varchar(100) NOT NULL COMMENT '模板名称',
  `tpl_type` varchar(16) NOT NULL COMMENT '模板类型',
  `tpl_content` text NOT NULL COMMENT '模板内容',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_tpl_key` (`tpl_key`),
  KEY `idx_sys_msg_tpl_type` (`tpl_type`),
  KEY `idx_sys_msg_tpl_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

-- ----------------------------
-- Records of js_sys_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_office`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_office`;
CREATE TABLE `js_sys_office` (
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '机构代码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `full_name` varchar(200) NOT NULL COMMENT '机构全称',
  `office_type` char(1) NOT NULL COMMENT '机构类型',
  `leader` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`office_code`),
  KEY `idx_sys_office_cc` (`corp_code`),
  KEY `idx_sys_office_pc` (`parent_code`),
  KEY `idx_sys_office_pcs` (`parent_codes`),
  KEY `idx_sys_office_status` (`status`),
  KEY `idx_sys_office_ot` (`office_type`),
  KEY `idx_sys_office_vc` (`view_code`),
  KEY `idx_sys_office_ts` (`tree_sort`),
  KEY `idx_sys_office_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Records of js_sys_office
-- ----------------------------
INSERT INTO `js_sys_office` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', '1', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:18', 'system', '2019-10-23 10:23:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '0', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', '2', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:18', 'system', '2019-10-23 10:23:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN01', 'SDJN', '0,SD,SDJN,', '30', '0000000040,0000000030,0000000030,', '1', '2', '山东公司/济南公司/企管部', 'SDJN01', '企管部', '山东济南企管部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN02', 'SDJN', '0,SD,SDJN,', '40', '0000000040,0000000030,0000000040,', '1', '2', '山东公司/济南公司/财务部', 'SDJN02', '财务部', '山东济南财务部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN03', 'SDJN', '0,SD,SDJN,', '50', '0000000040,0000000030,0000000050,', '1', '2', '山东公司/济南公司/研发部', 'SDJN03', '研发部', '山东济南研发部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '0', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', '2', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD01', 'SDQD', '0,SD,SDQD,', '30', '0000000040,0000000040,0000000030,', '1', '2', '山东公司/青岛公司/企管部', 'SDQD01', '企管部', '山东青岛企管部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD02', 'SDQD', '0,SD,SDQD,', '40', '0000000040,0000000040,0000000040,', '1', '2', '山东公司/青岛公司/财务部', 'SDQD02', '财务部', '山东青岛财务部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD03', 'SDQD', '0,SD,SDQD,', '50', '0000000040,0000000040,0000000050,', '1', '2', '山东公司/青岛公司/研发部', 'SDQD03', '研发部', '山东青岛研发部', '3', null, null, null, null, null, '0', 'system', '2019-10-23 10:23:19', 'system', '2019-10-23 10:23:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_post`;
CREATE TABLE `js_sys_post` (
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_type` varchar(100) DEFAULT NULL COMMENT '岗位分类（高管、中层、基层）',
  `post_sort` decimal(10,0) DEFAULT NULL COMMENT '岗位排序（升序）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`post_code`),
  KEY `idx_sys_post_cc` (`corp_code`),
  KEY `idx_sys_post_status` (`status`),
  KEY `idx_sys_post_ps` (`post_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工岗位表';

-- ----------------------------
-- Records of js_sys_post
-- ----------------------------
INSERT INTO `js_sys_post` VALUES ('ceo', '总经理', null, '1', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('cfo', '财务经理', null, '2', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('dept', '部门经理', null, '2', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('hrm', '人力经理', null, '2', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('user', '普通员工', null, '3', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for `js_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role`;
CREATE TABLE `js_sys_role` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_type` varchar(100) DEFAULT NULL COMMENT '角色分类（高管、中层、基层、其它）',
  `role_sort` decimal(10,0) DEFAULT NULL COMMENT '角色排序（升序）',
  `is_sys` char(1) DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `user_type` varchar(16) DEFAULT NULL COMMENT '用户类型（employee员工 member会员）',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围设置（0未设置  1全部数据 2自定义数据）',
  `biz_scope` varchar(255) DEFAULT NULL COMMENT '适应业务范围（不同的功能，不同的数据权限支持）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`role_code`),
  KEY `idx_sys_role_cc` (`corp_code`),
  KEY `idx_sys_role_is` (`is_sys`),
  KEY `idx_sys_role_status` (`status`),
  KEY `idx_sys_role_rs` (`role_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of js_sys_role
-- ----------------------------
INSERT INTO `js_sys_role` VALUES ('corpAdmin', '系统管理员', null, '200', '1', 'none', '0', null, '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', '客户方使用的管理员角色，客户方管理员，集团管理员', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('default', '默认角色', null, '100', '1', 'none', '0', null, '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', '非管理员用户，共有的默认角色，在参数配置里指定', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('dept', '部门经理', null, '40', '0', 'employee', '0', null, '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', '部门经理', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('user', '普通员工', null, '50', '0', 'employee', '0', null, '0', 'system', '2019-10-23 10:23:15', 'system', '2019-10-23 10:23:15', '普通员工', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_role_data_scope`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_data_scope`;
CREATE TABLE `js_sys_role_data_scope` (
  `role_code` varchar(64) NOT NULL COMMENT '控制角色编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`role_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据权限表';

-- ----------------------------
-- Records of js_sys_role_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_menu`;
CREATE TABLE `js_sys_role_menu` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`role_code`,`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of js_sys_role_menu
-- ----------------------------
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830414515068928');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415123243008');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415219712000');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415316180992');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415429427200');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415534284800');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415655919616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415752388608');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415874023424');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830415966298112');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416037601280');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416142458880');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416234733568');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416318619648');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416528334848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416608026624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416700301312');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416796770304');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416880656384');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830416972931072');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417061011456');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417144897536');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417228783616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417316864000');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417396555776');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417480441856');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417560133632');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417639825408');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417723711488');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417811791872');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417891483648');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830417971175424');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418055061504');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418134753280');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418227027968');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418315108352');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418403188736');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418487074816');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418600321024');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418675818496');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418755510272');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418839396352');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418914893824');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830418990391296');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419082665984');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419229466624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419321741312');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419405627392');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419481124864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419552428032');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419648897024');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419720200192');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419804086272');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830419883778048');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420005412864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420097687552');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420173185024');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420252876800');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420332568576');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420412260352');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420483563520');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420563255296');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420642947072');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420726833152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420802330624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420882022400');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830420949131264');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421020434432');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421095931904');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421192400896');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421263704064');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421347590144');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186830421427281920');

-- ----------------------------
-- Table structure for `js_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user`;
CREATE TABLE `js_sys_user` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `login_code` varchar(100) NOT NULL COMMENT '登录账号',
  `user_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) DEFAULT NULL COMMENT '绑定的手机串号',
  `user_type` varchar(16) NOT NULL COMMENT '用户类型',
  `ref_code` varchar(64) DEFAULT NULL COMMENT '用户类型引用编号',
  `ref_name` varchar(100) DEFAULT NULL COMMENT '用户类型引用姓名',
  `mgr_type` char(1) NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `pwd_security_level` decimal(1,0) DEFAULT NULL COMMENT '密码安全级别（0初始 1很弱 2弱 3安全 4很安全）',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `pwd_update_record` varchar(1000) DEFAULT NULL COMMENT '密码修改记录',
  `pwd_question` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `pwd_question_answer` varchar(200) DEFAULT NULL COMMENT '密保问题答案',
  `pwd_question_2` varchar(200) DEFAULT NULL COMMENT '密保问题2',
  `pwd_question_answer_2` varchar(200) DEFAULT NULL COMMENT '密保问题答案2',
  `pwd_question_3` varchar(200) DEFAULT NULL COMMENT '密保问题3',
  `pwd_question_answer_3` varchar(200) DEFAULT NULL COMMENT '密保问题答案3',
  `pwd_quest_update_date` datetime DEFAULT NULL COMMENT '密码问题修改时间',
  `last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `freeze_date` datetime DEFAULT NULL COMMENT '冻结时间',
  `freeze_cause` varchar(200) DEFAULT NULL COMMENT '冻结原因',
  `user_weight` decimal(8,0) DEFAULT '0' COMMENT '用户权重（降序）',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2停用 3冻结）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`user_code`),
  KEY `idx_sys_user_lc` (`login_code`),
  KEY `idx_sys_user_email` (`email`),
  KEY `idx_sys_user_mobile` (`mobile`),
  KEY `idx_sys_user_wo` (`wx_openid`),
  KEY `idx_sys_user_imei` (`mobile_imei`),
  KEY `idx_sys_user_rt` (`user_type`),
  KEY `idx_sys_user_rc` (`ref_code`),
  KEY `idx_sys_user_mt` (`mgr_type`),
  KEY `idx_sys_user_us` (`user_weight`),
  KEY `idx_sys_user_ud` (`update_date`),
  KEY `idx_sys_user_status` (`status`),
  KEY `idx_sys_user_cc` (`corp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of js_sys_user
-- ----------------------------
INSERT INTO `js_sys_user` VALUES ('admin', 'admin', '系统管理员', 'f790fcc79517db907ee924dcf0cbc90aae8566512052b573db2ef51c', null, null, null, null, null, null, null, null, 'none', null, null, '1', '1', '2019-10-23 10:23:18', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:18', 'system', '2019-10-23 10:23:18', '客户方使用的系统管理员，用于一些常用的基础数据配置。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('system', 'system', '超级管理员', '117d84c7c16b9e903215e7a35c682079a300118765fb5b83083e998e', null, null, null, null, null, null, null, null, 'none', null, null, '0', '1', '2019-10-23 10:34:25', '[[\"117d84c7c16b9e903215e7a35c682079a300118765fb5b83083e998e\",\"2019-10-23 10:34:24\"]]', null, null, null, null, null, null, null, '0:0:0:0:0:0:0:1', '2019-10-30 17:50:58', null, null, '0', '0', 'system', '2019-10-23 10:23:18', 'system', '2019-10-23 10:23:18', '开发者使用的最高级别管理员，主要用于开发和调试。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user10_ofhe', 'user10', '用户10', '59a97c4e01c180e7b409c02f7d7939f48fb811e3018beb8eb45bf294', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user10_ofhe', '用户10', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user11_i8ut', 'user11', '用户11', 'f3fb952ca5712362f449ebd83b245346c5dfccdd84ca73423b971c14', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user11_i8ut', '用户11', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user12_5ycu', 'user12', '用户12', '97d11fcf4a5869a2849fe5b0cf7f575e194bf81e83a6fdeffb677ea9', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user12_5ycu', '用户12', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user13_9vba', 'user13', '用户13', '6b8294a29b1e994e71f1acc29ff86089a44c68c814b993620b09ea5c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user13_9vba', '用户13', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user14_ujlf', 'user14', '用户14', 'e4a6511f254801fa29d7802544fd207ec5a91333efc4a64fb954f8fc', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user14_ujlf', '用户14', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user15_r0jc', 'user15', '用户15', 'e224c56d41724f190b475d27270a715086884bfead32e94168ecb408', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user15_r0jc', '用户15', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user16_yoso', 'user16', '用户16', 'a4e8709be1c751444d41451456d8f9520631dd13f7904d4f1b54a792', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user16_yoso', '用户16', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user17_nraf', 'user17', '用户17', 'a9a998e75c2a51332c370a0d1dbf2eed601eb9d0fc5a2f96d4e2ce2d', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user17_nraf', '用户17', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user18_tpdk', 'user18', '用户18', '761b679f09b1e699dfbacd8f0870d592de7fbf670959e07478a38467', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user18_tpdk', '用户18', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user19_jsc8', 'user19', '用户19', '20b3012172857d997b3f7900757b649f9bbf3cf12d0970620adc4d94', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user19_jsc8', '用户19', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user1_xjkl', 'user1', '用户01', 'c53ea07033efbab22dbe5bd3bf9fef8c4065dbc28191d89dc1dfb780', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user1_xjkl', '用户01', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user20_ndrg', 'user20', '用户20', '927c1d6668742fe39379447cd76e1ce9c2d5aaa28956a331b94575b4', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user20_ndrg', '用户20', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user21_9rwb', 'user21', '用户21', '52fafd232bf1465906c799865039ea244662b87406914c7b7782683c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user21_9rwb', '用户21', '0', '0', '2019-10-23 10:23:21', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user22_n01o', 'user22', '用户22', 'ae0bdde8a22bd6b319d8137e7e41730c0d4bc240c6f65c6414ab9c8c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user22_n01o', '用户22', '0', '0', '2019-10-23 10:23:21', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user23_u2pw', 'user23', '用户23', '1b426b431689dc680a5f0770542c57da0e4ca304107831fad807b7d5', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user23_u2pw', '用户23', '0', '0', '2019-10-23 10:23:21', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:21', 'system', '2019-10-23 10:23:21', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user2_1j0x', 'user2', '用户02', '8fd0543f0fb7ee1887a0254315f28013e0cac51c8b41c24f6040540c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user2_1j0x', '用户02', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user3_pxjf', 'user3', '用户03', '30a6e3d580926191fd7240839cd57cfe4c2bcf7e05df0ba1f0f4a235', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user3_pxjf', '用户03', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user4_047q', 'user4', '用户04', '587c9ce63ddcb4b776c7a8f9149e3152ffccff3d253d13c323e3d02a', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user4_047q', '用户04', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user5_cc84', 'user5', '用户05', '46dc7688860e359b733ce1ad55dea6dfdec297318f497241e5d29d80', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user5_cc84', '用户05', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user6_2y8l', 'user6', '用户06', '2d2c3cb6dde4f8fd032886f2be9a931dcfcd8c45c77b92e66d979786', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user6_2y8l', '用户06', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user7_vcvr', 'user7', '用户07', 'e4f740df71fef7ba4de480581e142923290f698d3164a96b7c2037f2', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user7_vcvr', '用户07', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user8_udq2', 'user8', '用户08', '8a6c752b89a8b951b2ffd2f35743adcbb46341760aa13a7b9c595cec', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user8_udq2', '用户08', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user9_ai2w', 'user9', '用户09', 'a3ea1e6c6649653b13bd2ee49d519074e733c0aa9916617cc5162c67', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user9_ai2w', '用户09', '0', '0', '2019-10-23 10:23:20', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-23 10:23:20', 'system', '2019-10-23 10:23:20', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `js_sys_user_data_scope`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_data_scope`;
CREATE TABLE `js_sys_user_data_scope` (
  `user_code` varchar(100) NOT NULL COMMENT '控制用户编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`user_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of js_sys_user_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for `js_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_role`;
CREATE TABLE `js_sys_user_role` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user_code`,`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of js_sys_user_role
-- ----------------------------
INSERT INTO `js_sys_user_role` VALUES ('user10_ofhe', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user11_i8ut', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user12_5ycu', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user13_9vba', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user14_ujlf', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user15_r0jc', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user16_yoso', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user17_nraf', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user18_tpdk', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user19_jsc8', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user1_xjkl', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user20_ndrg', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user21_9rwb', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user22_n01o', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user23_u2pw', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user2_1j0x', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user3_pxjf', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user4_047q', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user5_cc84', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user6_2y8l', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user7_vcvr', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user8_udq2', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user9_ai2w', 'user');

-- ----------------------------
-- Table structure for `test_data`
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据';

-- ----------------------------
-- Records of test_data
-- ----------------------------
INSERT INTO `test_data` VALUES ('1186840995768893440', 'dsd', 'd', '1', '1', '1', '1', '2019-10-23 00:00:00', '2019-10-23 11:05:00', 'user7_vcvr', 'SDQD02', '370202', '市南区', '0', 'system', '2019-10-23 11:05:18', 'system', '2019-10-23 11:05:29', 'df');

-- ----------------------------
-- Table structure for `test_data_child`
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_sort` int(11) DEFAULT NULL COMMENT '排序号',
  `test_data_id` varchar(64) DEFAULT NULL COMMENT '父表主键',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------
INSERT INTO `test_data_child` VALUES ('1186840995861168128', null, '1186840995768893440', '', '', '', '', '', '', null, null, '', '', '', '');

-- ----------------------------
-- Table structure for `test_tree`
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `tree_code` varchar(64) NOT NULL COMMENT '节点编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `tree_name` varchar(200) NOT NULL COMMENT '节点名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`tree_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试树表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES ('1', '0', '0,', '30', '0000000030,', '0', '0', '1', '1', '0', 'system', '2019-10-30 16:28:15', 'system', '2019-10-30 16:28:15', '1');
INSERT INTO `test_tree` VALUES ('2', '1', '0,1,', '30', '0000000030,0000000030,', '1', '1', '1/2', '2', '0', 'system', '2019-10-30 16:28:36', 'system', '2019-10-30 16:28:36', '2');
