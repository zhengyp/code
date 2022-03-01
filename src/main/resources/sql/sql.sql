-- we don't know how to generate root <with-no-name> (class Root) :(
create table dept
(
    id bigint auto_increment comment '序号'
        primary key,
    name varchar(255) null comment '名称',
    description varchar(255) null comment '描述',
    state tinyint(1) null comment '状态',
    parent bigint null
)
    collate=utf8mb4_unicode_ci;

create table dictionary
(
    id varchar(32) not null
        primary key,
    name varchar(32) null,
    is_delete smallint default 0 null
);

create table dictionary_item
(
    id varchar(32) not null,
    name varchar(32) null,
    dictionary_id varchar(32) null,
    is_deleted smallint default 0 null,
    `key` varchar(32) null,
    constraint dictionary_item_id_uindex
        unique (id)
);

alter table dictionary_item
    add primary key (id);

create table t_log
(
    id bigint auto_increment comment '序号'
        primary key,
    content varchar(1000) null comment '操作内容',
    time varchar(255) null comment '操作时间',
    user varchar(255) null comment '操作人',
    ip varchar(255) null comment 'ip'
)
    collate=utf8mb4_unicode_ci;

create table t_message
(
    id bigint auto_increment comment 'ID'
        primary key,
    content text collate utf8mb4_general_ci null comment '内容',
    username varchar(255) null comment '评论人',
    time varchar(255) collate utf8mb4_general_ci null comment '评论时间',
    parent_id bigint null comment '父ID',
    foreign_id bigint default 0 null comment '关联id'
)
    comment '留言表' collate=utf8mb4_unicode_ci;

create table t_notice
(
    id bigint auto_increment comment 'ID'
        primary key,
    title varchar(255) null comment '标题',
    content text null comment '内容',
    time varchar(255) null comment '发布时间'
)
    collate=utf8mb4_unicode_ci;

create table t_permission
(
    id bigint auto_increment
        primary key,
    name varchar(255) null comment '名称',
    description varchar(255) null comment '描述',
    path varchar(255) null comment '菜单路径',
    icon varchar(255) default 's-data' null comment '图标'
)
    comment '权限菜单表' charset=utf8;

create table t_role
(
    id bigint auto_increment comment 'ID'
        primary key,
    name varchar(255) null comment '名称',
    description varchar(255) null comment '描述',
    permission varchar(2000) null comment '权限列表'
)
    comment '角色表' charset=utf8;

create table t_user
(
    id bigint auto_increment
        primary key,
    username varchar(255) not null comment '用户名',
    password varchar(255) null comment '密码',
    nick_name varchar(255) null comment '昵称',
    email varchar(255) null comment '邮箱',
    phone varchar(255) null comment '手机号',
    avatar varchar(255) null comment '头像',
    role varchar(255) null comment '角色',
    address varchar(255) null comment '地址',
    age int null comment '年龄'
)
    comment '用户表' collate=utf8mb4_unicode_ci;

create table test_case
(
    id int auto_increment comment '编号'
        primary key,
    name varchar(255) null comment '标题',
    operate_status varchar(50) null comment '状态',
    sprint varchar(50) null comment '所属迭代',
    requirement varchar(225) null comment '需求',
    case_type varchar(255) null comment '类型',
    business_component varchar(20) null comment '模块',
    pre_condition varchar(255) null comment '前置条件',
    input_args varchar(255) null comment '请求参数',
    response_data varchar(255) null comment '返回参数',
    anticipate varchar(255) null comment '预期返回',
    create_time datetime null comment '创建时间',
    creator varchar(50) null comment '创建人',
    update_time datetime null comment '更新时间',
    updater varchar(50) null comment '更新人',
    is_deleted tinyint(1) default 0 null comment '是否删除',
    version int default 1 null
);

INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (1, '用户管理', '用户管理', 'user', 'user-solid');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (2, '角色管理', '角色管理', 'role', 's-cooperation');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (3, '权限管理', '权限管理', 'permission', 'menu');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (19, '公告管理', '公告管理', 'notice', 'data-board');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (24, '日志管理', '日志管理', 'log', 'notebook-2');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (25, '在线留言', '在线留言', 'message', 'message');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (26, '类型管理', '类型管理', 'dept', 's-data');
INSERT INTO test.t_permission (id, name, description, path, icon) VALUES (28, '测试用例管理', '测试用例管理', 'testCase', 's-data');

INSERT INTO test.t_role (id, name, description, permission) VALUES (1, '超级管理员', '所有权限', '[1,2,3,19,26,28,25,24]');
INSERT INTO test.t_role (id, name, description, permission) VALUES (2, '普通用户', '部分权限', '[]');

INSERT INTO test.t_user (id, username, password, nick_name, email, phone, avatar, role, address, age) VALUES (1, 'admin', 'admin', '管理员', '111124444', '13978786565', '1625537663758', '[1]', '北京', null);
INSERT INTO test.t_user (id, username, password, nick_name, email, phone, avatar, role, address, age) VALUES (2, 'zhang', '123456', '张三', 'zhang@qq.com', '13089897878', null, '[2]', '北京', 24);
INSERT INTO test.t_user (id, username, password, nick_name, email, phone, avatar, role, address, age) VALUES (3, 'li', '123456', '李四', 'li@qq.com', '13989897898', null, '[2]', '南京', 22);

INSERT INTO test.dept (id, name, description, state, parent) VALUES (22, '新增', '新增', 1, null);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (23, '编辑', '编辑', 1, null);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (24, '查询', '查询', 1, null);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (25, '删除', '删除', 1, null);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (26, '入口', '不同页面/业务新增,单个或批量接口', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (27, '等价类', '有效等价类和无效等价类', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (28, '边界值', '边界值和长度等', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (29, '特殊符号和空格检查', '字母数字特殊符号', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (30, '反向流程', '流程中断或者回退，对已生成数据影响', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (31, '并发请求', '并发请求或者重复提交', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (32, '权限', '权限', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (33, '重复数据', '重复数据', 1, 22);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (34, '数据回显', '新增的数据详情页展示正确', 1, 23);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (36, '数据校验', '编辑校验同新增', 1, 23);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (37, '修改历史数据对存量数据的影响', '比如修改产品对改产品对关联订单的影响', 1, 23);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (38, '查询全部数据', '空条件查询', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (39, '组合条件查询', '单个条件或者多个条件组合查询', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (40, '模糊查询', '模糊查询', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (41, '分页查询', '分页和精准查询或者修改分页默认查询', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (42, '默认查询', '初次进入页面或者切换至该页面的默认查询', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (43, '排序', '新增或者修改后的排序', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (44, '导出', '列表查询导出', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (45, '新数据删除', '删除后的列表不展示，其他新增页面不展示', 1, 25);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (46, '查询已删除数据', '能查或者查不到', 1, 24);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (47, '删除老数据', '删除老数据后对关联数据影响', 1, 25);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (49, '接口', '接口', 1, 26);
INSERT INTO test.dept (id, name, description, state, parent) VALUES (50, '页面测试', '页面测试', 1, null);

INSERT INTO test.dictionary_item (id, name, dictionary_id, is_deleted, `key`) VALUES ('cs1', '未执行', 'CASE_STATUS', 0, 'NOT_EXECUTE');
INSERT INTO test.dictionary_item (id, name, dictionary_id, is_deleted, `key`) VALUES ('cs2', '已执行', 'CASE_STATUS', 0, 'EXECUTED');

INSERT INTO test.dictionary (id, name, is_delete) VALUES ('CASE_STATUS', '用例状态', 0);

create table requirement
(
    id int auto_increment comment '编号'
        primary key,
    name varchar(255) null comment '标题',
    background varchar(255) null comment '需求背景',
    content varchar(500) null comment '具体内容',
    related varchar(255) null comment '关联内容',
    create_time datetime null comment '创建时间',
    creator varchar(255) null comment '创建人',
    update_time datetime null comment '更新时间',
    updator varchar(255) null comment '更新人'
);

INSERT INTO test.test_case (id, name, operate_status, sprint, requirement, case_type, business_component, pre_condition, input_args, response_data, anticipate, create_time, creator, update_time, updater, is_deleted, version) VALUES (10, 'dfd', 'EXECUTED', 'fdfdf', 'dfd', '49', 'fdf ', 'dfdf', 'fdfd', 'fd', 'dfd', '2021-07-14 11:14:55', null, '2021-07-14 11:14:55', null, 0, 1);
INSERT INTO test.test_case (id, name, operate_status, sprint, requirement, case_type, business_component, pre_condition, input_args, response_data, anticipate, create_time, creator, update_time, updater, is_deleted, version) VALUES (11, '测试2', 'NOT_EXECUTE', '迭代1', '需求1', '40', '模块1', '前置', '请求', '返回', '预期', '2021-07-14 11:28:44', null, '2021-10-25 15:20:26', null, 0, 2);