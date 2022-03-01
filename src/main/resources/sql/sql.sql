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

INSERT INTO test.poem (id, name, author, content, period) VALUES (3, '扬州慢·淮左名都', '姜夔', '淳熙丙申至日，予过维扬。夜雪初霁，荠麦弥望。望其城，则四顾萧条，寒水自碧，暮色渐起，戍角悲鸣。

    予怀怆然，感慨今昔，因自度此曲，千岩老人以为有黍离之悲也。

    淮左名都，竹西佳处，解鞍少驻初程。过春风十里。尽荠麦青青。自胡马窥江去后，废池乔木，犹厌言兵。渐黄昏，清角吹寒，都在空城。杜郎俊赏，算而今重到须惊。纵豆蔻词工，青楼梦好，难赋深情。二十四桥仍在，波心荡，冷月无声。念桥边红药，年年知为谁生。

解析：
维扬：扬州的别称。《书．禹贡》: 淮海惟扬州。惟，通''维''。后因截取二字以为名。

夜雪初霁：雨后或雪后转晴，王勃滕王阁序有 云销雨霁，彩彻区明之说。

荠麦：指野生的麦子，中国农民素有精耕细作之说，荠麦的出现说明民不聊生。

黍离：出自王风·黍离  彼黍离离，彼稷之苗/穗/实 中心摇摇/如醉/如噎，知我者谓我何忧，不知我者谓我何求。悠悠苍天，此何人哉。

淮左：宋在苏北和皖北（江淮及沿淮地区）分别设淮南东路和淮南西路，淮南东路又称淮左，淮南西路称淮右。淮右多山，淮左多水。淮左现指江苏江淮之间的扬州、泰州、淮安、盐城、连云港(市区、市南)、宿迁(除西)六个地级市。

竹西：出自杜牧。谁知竹西路，歌吹是扬州。

春风十里：出自杜牧赠别二首：娉娉袅袅十三余，豆蔻梢头二月初。春风十里扬州路，卷上珠帘总不如。

青楼：出自杜牧遣怀。落魄江湖载酒行，楚腰纤细掌中轻。十年一觉扬州梦，赢得青楼薄幸名。

二十四桥：杭州瘦西湖二十四桥。杜牧：青山隐隐水迢迢，秋尽江南草未凋，二十四桥明月夜，玉人何处教吹箫。

红药：指红芍药花。

', '南宋');
INSERT INTO test.poem (id, name, author, content, period) VALUES (4, '琵琶行', '白居易', '浔阳江头夜送客，枫叶荻花秋瑟瑟。主人下马客在船，举酒欲饮无管弦。醉不成欢惨将别，别时茫茫江浸月。
忽闻水上琵琶声，主人忘归客不发。寻声暗问弹者谁，琵琶声停欲语迟。移船相近邀相见，添酒回灯重开宴。
千呼万唤始出来，犹抱琵琶半遮面。转轴拨弦三两声，未成曲调先有情。弦弦掩抑声声思，似诉平生不得志。
低眉信手续续弹，说尽心中无限事。轻拢慢捻抹复挑，初为霓裳后六幺。大弦嘈嘈如急雨，小弦切切如私语。
嘈嘈切切错杂弹，大珠小珠落玉盘。间关莺语花底滑，幽咽泉流冰下难。冰泉冷涩弦凝绝，凝绝不通声暂歇。
别有幽愁暗恨生，此时无声胜有声。银瓶乍破水浆迸，铁剂突出刀枪鸣。曲终收拨当心画，四弦一声如裂帛。
东船西舫悄无言，唯见江心秋月白。沉吟放拨插弦中，整顿衣裳起敛容。自言本是京城女，家在蛤蟆菱下住。
十三学得琵琶成，名属教坊第一部。曲罢曾教善才服，妆成每被秋娘妒。五陵年少争缠头，一曲红绡不知数。
钿头银篦击节碎，血色罗裙翻酒污。今年欢笑复明年，秋月春风等闲度。弟走从军阿姨死，暮去朝来颜色故。
门前冷落车马稀，老大嫁作商人妇。商人重利轻别离，前月浮梁买茶去。去来江口守空船，绕船明月江水寒。
深夜忽梦少年事，梦啼妆泪红阑干。我闻琵琶已叹息，又闻此语重唧唧。同是天涯沦落人，相逢何必曾相识。
我从去年辞帝京，谪居卧病浔阳场。浔阳地僻无音乐，终岁不闻丝竹声。住近湓江地低湿，黄芦苦竹绕宅生。
其间旦暮闻何物，杜鹃啼血猿哀鸣。春江花朝秋月夜，往往取酒还独倾。岂闻山歌与村笛，呕哑嘲哳难为听。
今夜闻君琵琶语，如听仙乐耳暂明。莫辞更坐弹一曲，为君翻作琵琶行。感我此言良久立，却坐促弦弦转急。
凄凄不似向前声，满座重闻皆掩泣。座中泣下谁最多，江州司马青衫湿。', '唐');
INSERT INTO test.poem (id, name, author, content, period) VALUES (5, '过秦论', '贾谊', '秦孝公据崤函之固，拥雍州之地，君臣固守以窥周室，有席卷天下，包举宇内，囊括四海之意，并吞八荒之心。当是时也，商君佐之，内立法度，务耕织，修守战之具，外连衡而斗诸侯。于是秦人拱手而取西河之外。

孝公既没，惠文、武、昭襄蒙故业，因遗策，南取汉中，西举巴、蜀，东割膏腴之地，北收要害之郡。诸侯恐惧，会盟而谋弱秦，不爱珍器重宝肥饶之地，以致天下之士，合从缔交，相与为一。当此之时，齐有孟尝，赵有平原，楚有春申，魏有信陵。此四君者，皆明智而忠信，宽厚而爱人，尊贤而重士，约从离衡，兼韩、魏、燕、楚、齐、赵、宋、卫、中山之众。于是六国之士，有宁越、徐尚、苏秦、杜赫之属为之谋，齐明、周最、陈轸、召滑、楼缓、翟景、苏厉、乐毅之徒通其意，吴起、孙膑、带佗、倪良、王廖、田忌、廉颇、赵奢之伦制其兵。尝以十倍之地，百万之众，叩关而攻秦。秦人开关延敌，九国之师，逡巡而不敢进。秦无亡矢遗镞之费，而天下诸侯已困矣。于是从散约败，争割地而赂秦。秦有余力而制其弊，追亡逐北，伏尸百万，流血漂橹；因利乘便，宰割天下，分裂山河。强国请服，弱国入朝。

延及孝文王、庄襄王，享国之日浅，国家无事。

及至始皇，奋六世之余烈，振长策而御宇内，吞二周而亡诸侯，履至尊而制六合，执敲扑而鞭笞天下，威振四海。南取百越之地，以为桂林、象郡；百越之君，俯首系颈，委命下吏。乃使蒙恬北筑长城而守藩篱，却匈奴七百余里；胡人不敢南下而牧马，士不敢弯弓而报怨。于是废先王之道，焚百家之言，以愚黔首；隳名城，杀豪杰；收天下之兵，聚之咸阳，销锋镝，铸以为金人十二，以弱天下之民。然后践华为城，因河为池，据亿丈之城，临不测之渊，以为固。良将劲弩守要害之处，信臣精卒陈利兵而谁何。天下已定，始皇之心，自以为关中之固，金城千里，子孙帝王万世之业也。

始皇既没，余威震于殊俗。然陈涉瓮牖绳枢之子，氓隶之人，而迁徙之徒也；才能不及中人，非有仲尼，墨翟之贤，陶朱、猗顿之富；蹑足行伍之间，而倔起阡陌之中，率疲弊之卒，将数百之众，转而攻秦；斩木为兵，揭竿为旗，天下云集响应，赢粮而景从。山东豪俊遂并起而亡秦族矣。

且夫天下非小弱也，雍州之地，崤函之固，自若也。陈涉之位，非尊于齐、楚、燕、赵、韩、魏、宋、卫、中山之君也；锄櫌棘矜，非铦于钩戟长铩也；谪戍之众，非抗于九国之师也；深谋远虑，行军用兵之道，非及向时之士也。然而成败异变，功业相反，何也？试使山东之国与陈涉度长絜大，比权量力，则不可同年而语矣。然秦以区区之地，致万乘之势，序八州而朝同列，百有余年矣；然后以六合为家，崤函为宫；一夫作难而七庙隳，身死人手，为天下笑者，何也？仁义不施而攻守之势异也。', '汉');
INSERT INTO test.poem (id, name, author, content, period) VALUES (6, '论积贮疏', '贾谊', '管子曰：“仓廪实而知礼节。”民不足而可治者，自古及今，未之尝闻。古之人曰：“一夫不耕，或受之饥；一女不织，或受之寒。” 生之有时，而用之亡度，则物力必屈。古之治天下，至孅至悉也，，故其畜积足恃。今背本而趋末，食者甚众，是天下之大残也；淫侈之俗，日日以长，是天下之大贼也。残贼公行，莫之或止；大命将泛，莫之振救。生之者甚少，而靡之者甚多，天下财产何得不蹶！
汉之为汉，几四十年矣，公私之积，犹可哀痛！失时不雨，民且狼顾；岁恶不入，请卖爵子，既闻耳矣。安有为天下阽危者若是而上不惊者？世之有饥穰，天之行也，禹、汤被之矣。即不幸有方二三千里之旱，国胡以相恤？卒然边境有急，数千百万之众，国胡以馈之？兵旱相乘，天下大屈，有勇力者聚徒而衡击；罢夫羸老易子而咬其骨。政治未毕通也，远方之能疑者，并举而争起矣。乃骇而图之，岂将有及乎？
夫积贮者，天下之大命也。苟粟多而财有余，何为而不成？以攻则取，以守则固，以战则胜。怀敌附远，何招而不至！今殴民而归之农，皆著于本；使天下各食其力，末技游食之民，转而缘南亩，则畜积足而人乐其所矣。可以为富安天下，而直为此廪廪也，窃为陛下惜之。
节自《汉书·食货志》
古之人：指管子 后面四句取自《管子·轻重甲》 管子曰：“一农不耕，民或为之饥；一女不织，民或为之寒。
一夫：夫指 男人
或：指 有的人 代词
生之有时：生产物质财富有时间的限制  用之亡度：亡 同 无   物力屈：屈指 枯竭穷尽
至孅至悉也：xian 通 纤 指细致  悉：详细周密
故其畜积足恃：畜通 蓄 恃指依赖 依靠    背本趋末：放弃重要的事情而去从事不重要的事情：指西汉初年重商抑制农业
残：害 危害 祸害
淫侈之俗：奢侈chi的风气。淫，过分，副词                   日日以长:zhang 增长   贼：祸害 危害  残贼：指上文的祸害  公行：公然盛行
即“莫或止之”，没有人去稍微制止它一下。莫，没有人，代词。之，代词，指“残贼公行”之事。是“止”的宾语，前置。或，副词，有“稍微”、“稍稍”之意。
大命：国家命运  泛：通“覂”，翻覆，覆灭。振救，拯救，挽救。  靡：消费   蹶：枯竭
几：将近  公私：国家和个人的  犹：仍然 可哀痛：指积蓄少得使人痛心。
失时不雨，民且狼顾：错过季节不下雨  民众将会比喻人有后顾之忧忧虑不安    岁恶：年景不好。恶坏  不入：指纳不了税。“入”是“纳”的意思
请卖爵（jué）子：即请爵卖子。指富者向国家缴粮买爵位，贫者卖儿女为生。汉朝有公家出卖爵位以收取钱财的制度
既闻耳矣:闻于耳，指上述严重情况传到了皇帝的耳中。
哪有治理国家已经危险到这种地步而皇上不震惊的呢  为:治理  阽危:临近危险  是：如此，象这个样子。
饥穰：荒年和丰年。此处为偏义复词，只指荒年。饥，灾荒，《墨子·七患》：“五谷不收谓之饥。”穰，庄稼丰熟。
被：遭，受。之：代词，指“饥穰”。传说禹时有九年的水灾，汤时有七年的旱灾。   恤：周济，救济。 馈：进食于人，此处指发放粮饷，供养军队。衡通横 罢pi：通“疲”。
假若兵灾旱灾交互侵袭，国家财富极其缺乏，胆大力壮的人就聚集歹徒横行抢劫，年老体弱的人就互换子女来吃

积贮，是国家的命脉。如果粮食多财力充裕，干什么事情会做不成？凭借它去进攻就能攻取，凭借它去防守就能巩固，凭借它去作战就能战胜。使敌对的人归降，使远方的人顺附，招谁而不来呢？现在如果驱使百姓，让他们归向农业，都附着于本业，使天下的人靠自己的劳动而生活，工商业者和不劳而食的游民，都转向田间从事农活，那么积贮就会充足，百姓就能安居乐业了。本来可以做到使国家富足安定，却竟造成了这种令人危惧的局面！我真替陛下痛惜啊！


西汉建立初年，社会经济一片凋敝。据《汉书·食货志》记载，那时米价昂贵，饥馑遍地，人与人相食，物资匮乏，连天子出行都弄不到四匹同色的马驾车，将相只能乘牛车。汉高祖刘邦采取了一系列予民休养生息和“重农抑商”的政策，到汉文帝时，社会经济逐渐恢复，但商贾、地主侵夺农民，土地兼并日益严重，广大农民因破产而纷纷流入城市，成为工商业的佣工或无业的游民，官僚、商贾的淫侈之风也日益增长，这些都严重影响农业生产和粮食的积贮，很不利于西汉封建政权的巩固，同时北方匈奴的威胁也越来越严重，面对这种日益严重的内忧外患的实际情况，贾谊就向文帝上了这份奏疏，建议重视农业生产，以增加积贮。题目《论积贮疏》的意思是：论述有关积贮的重大意义的奏疏。疏，指分条陈述；作为一种文体，它是古代臣下向皇帝条陈自己对某事的意见的一种文件，也称“奏疏”或“奏议”。 [3-4] ', '汉');
INSERT INTO test.poem (id, name, author, content, period) VALUES (7, '赤壁赋', '苏轼', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。
于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。
苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”
苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者如彼，而卒莫消长也。盖将自其变者而观之，则天地曾不能以一瞬；自其不变者而观之，则物与我皆无尽也，而又何羡乎！且夫天地之间，物各有主，苟非吾之所有，虽一毫而莫取。惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色，取之无禁，用之不竭，是造物者之无尽藏也，而吾与子之所共适。”
客喜而笑，洗盏更酌。肴核既尽，杯盘狼籍。相与枕藉乎舟中，不知东方之既白。

属（zhǔ）：倾注，引申为劝酒。明月之诗：指《诗经·陈风·月出》
窈窕（yǎotiǎo）之章：《陈风·月出》诗首章为：“月出皎兮，佼人僚兮，舒窈纠兮，劳心悄兮。”“窈纠”同“窈窕”。
“纵一苇”二句：任凭小船在宽广的江面上飘荡。纵，任凭。一苇，比喻极小的船。《诗经·卫风·河广》：“谁谓河广，一苇杭（航）之。”如，往。凌，越过。万顷，极为宽阔的江面。茫然，旷远的样子。

壬戌年秋天，七月十六日，我与友人在赤壁下泛舟游玩。清风阵阵拂来，水面波澜不起。举起酒杯向同伴劝酒，吟诵《明月》中“窈窕”这一章。不一会儿，明月从东山后升起，在斗宿与牛宿之间缓步徐行。白茫茫的雾气横贯江面，水光连着天际。放纵一片苇叶似的小船随意漂浮，越过茫茫的江面。浩浩淼淼好像乘风凌空而行，并不知道到哪里才会停栖，飘飘摇摇好像要离开尘世飘飞而起，羽化成仙进入仙境。
在这时喝酒喝得非常高兴，敲着船边唱起歌来。歌中唱到：“桂木船棹啊香兰船桨，击打着月光下的清波，在泛着月光的水面逆流而上。我的情思啊悠远茫茫，眺望美人啊，却在天的另一方。”有会吹洞箫的客人，配着节奏为歌声伴和，洞箫的声音呜呜咽咽：有如哀怨有如思慕，既像啜泣也像倾诉，余音在江上回荡，像细丝一样连续不断。能使深谷中的蛟龙为之起舞，能使孤舟上的寡妇为之饮泣。
我的神色也愁惨起来，整好衣襟坐端正，向客人问道：“箫声为什么这样哀怨呢？”客人回答：“‘月明星稀，乌鹊南飞’，这不是曹公孟德的诗么？这里向西可以望到夏口，向东可以望到武昌，山河接壤连绵不绝，目力所及，一片郁郁苍苍。这不正是曹孟德被周瑜所围困的地方么？当初他攻陷荆州，夺得江陵，沿长江顺流东下，麾下的战船首尾相连延绵千里，旗子将天空全都蔽住，面对大江斟酒，横执长矛吟诗，本来是当世的一位英雄人物，然而现在又在哪里呢？何况我与你在江中的小洲打渔砍柴，以鱼虾为侣，以麋鹿为友，在江上驾着这一叶小舟，举起杯盏相互敬酒，如同蜉蝣置身于广阔的天地中，像沧海中的一粒粟米那样渺小。唉，哀叹我们的一生只是短暂的片刻，不由羡慕长江的没有穷尽。想要携同仙人携手遨游各地，与明月相拥而永存世间。知道这些终究不能实现，只得将憾恨化为箫音，托寄在悲凉的秋风中罢了。”
我问道：“你可也知道这水与月？时间流逝就像这水，其实并没有真正逝去；时圆时缺的就像这月，终究没有增减。可见，从事物易变的一面看来，那么天地间万事万物时刻在变动，连一眨眼的工夫都不停止；而从事物不变的一面看来，万物同我们来说都是永恒的，又有什么可羡慕的呢？何况天地之间，万物各有主宰者，若不是自己应该拥有的，即使一分一毫也不能求取。只有江上的清风，以及山间的明月，听到便成了声音，进入眼帘便绘出形色，取得这些不会有人禁止，感受这些也不会有竭尽的忧虑。这是大自然恩赐的没有穷尽的宝藏，我和你可以共同享受。”
客人高兴地笑了，洗净酒杯重新斟酒。菜肴果品都已吃完，杯子盘子杂乱一片。大家互相枕着垫着睡在船上，不知不觉东方已经露出白色的曙光。 [6] ', '北宋');
INSERT INTO test.poem (id, name, author, content, period) VALUES (8, '石钟山记', '苏轼', '《水经》云：“彭蠡之口有石钟山焉。”郦元以为下临深潭，微风鼓浪，水石相搏，声如洪钟。是说也，人常疑之。今以钟磬置水中，虽大风浪不能鸣也，而况石乎！至唐李渤始访其遗踪，得双石于潭上，扣而聆之，南声函胡，北音清越，桴止响腾，余韵徐歇。自以为得之矣。然是说也，余尤疑之。石之铿然有声者，所在皆是也，而此独以钟名，何哉？
元丰七年六月丁丑，余自齐安舟行适临汝，而长子迈将赴饶之德兴尉，送之至湖口，因得观所谓石钟者。寺僧使小童持斧，于乱石间择其一二扣之，硿硿焉。余固笑而不信也。至莫夜月明，独与迈乘小舟，至绝壁下。大石侧立千尺，如猛兽奇鬼，森然欲搏人；而山上栖鹘，闻人声亦惊起，磔磔云霄间；又有若老人咳且笑于山谷中者，或曰此鹳鹤也。余方心动欲还，而大声发于水上，噌吰如钟鼓不绝。舟人大恐。徐而察之，则山下皆石穴罅，不知其浅深，微波入焉，涵淡澎湃而为此也。舟回至两山间，将入港口，有大石当中流，可坐百人，空中而多窍，与风水相吞吐，有窾坎镗鞳之声，与向之噌吰者相应，如乐作焉。因笑谓迈曰：“汝识之乎？噌吰者，周景王之无射也；窾坎镗鞳者，魏庄子之歌钟也。古之人不余欺也！”
事不目见耳闻，而臆断其有无，可乎？郦元之所见闻，殆与余同，而言之不详；士大夫终不肯以小舟夜泊绝壁之下，故莫能知；而渔工水师虽知而不能言。此世所以不传也。而陋者乃以斧斤考击而求之，自以为得其实。余是以记之，盖叹郦元之简，而笑李渤之陋也。


《水经》说：“鄱阳湖的湖口有一座石钟山在那里。”郦道元认为石钟山下面靠近深潭，微风振动波浪，水和石头互相拍打，发出的声音好像大钟一般。这个说法，人们常常怀疑它。如果把钟磬放在水中，即使大风大浪也不能使它发出声响，何况是石头呢！到了唐代李渤才访求石钟山的旧址。在深潭边找到两块山石，敲击它们，聆听它们的声音，南边那座山石的声音重浊而模糊，北边那座山石的声音清脆而响亮，鼓槌停止了敲击，声音还在传播，余音慢慢地消失。他自己认为找到了这个石钟山命名的原因。但是这个说法，我更加怀疑。敲击后能发出声响的石头，到处都这样，可唯独这座山用钟来命名，这是为什么呢？
元丰七年六月初九，我从齐安坐船到临汝去，大儿子苏迈将要去就任饶州的德兴县的县尉，我送他到湖口，因而能够看到所说的石钟山。庙里的和尚让小童拿着斧头，在乱石中间选一两处敲打它，硿硿地发出声响，我当然觉得很好笑并不相信。到了晚上月光明亮，特地和苏迈坐着小船到断壁下面。巨大的山石倾斜地立着，有千尺之高，好像凶猛的野兽和奇异的鬼怪，阴森森地想要攻击人；山上宿巢的老鹰，听到人声也受惊飞起来，在云霄间发出磔磔声响；又有像老人在山谷中咳嗽并且大笑的声音，有人说这是鹳鹤。我正心惊想要回去，忽然巨大的声音从水上发出，声音洪亮像不断地敲钟击鼓。船夫很惊恐。我慢慢地观察，山下都是石穴和缝隙，不知它们有多深，细微的水波涌进那里面，水波激荡因而发出这种声音。船回到两山之间，将要进入港口，有块大石头正对着水的中央，上面可坐百来个人，中间是空的，而且有许多窟窿，把清风水波吞进去又吐出来，发出窾坎镗鞳的声音，同先前噌吰的声音相互应和，好像音乐演奏。于是我笑着对苏迈说：“你知道那些典故吗？那噌吰的响声，是周景王无射钟的声音，窾坎镗鞳的响声，是魏庄子歌钟的声音。古人没有欺骗我啊！”
任何的事情不用眼睛看不用耳朵听，只凭主观臆断去猜测它的有或没有，可以吗？郦道元所看到的、所听到的，大概和我一样，但是描述它不详细；士大夫终究不愿用小船在夜里在悬崖绝壁的下面停泊，所以没有谁能知道；渔人和船夫，虽然知道石钟山命名的真相却不能用文字记载。这就是世上没有流传下来石钟山得名由来的原因。然而浅陋的人竟然用斧头敲打石头来寻求石钟山得名的原因，自以为得到了石钟山命名的真相。我因此记下以上的经过，叹惜郦道元的简略，嘲笑李渤的浅陋。 [5]
创作背景编辑', '北宋');
INSERT INTO test.poem (id, name, author, content, period) VALUES (9, '桃花庵歌', '唐寅', '桃花坞里桃花庵，桃花庵里桃花仙。
桃花仙人种桃树，又摘桃花换酒钱。
酒醒只在花前坐，酒醉还来花下眠。
半醒半醉日复日，花落花开年复年。
但愿老死花酒间，不愿鞠躬车马前。
车尘马足富者趣，酒盏花枝贫者缘。
若将富贵比贫者，一在平地一在天。
若将贫贱比车马，他得驱使我得闲。
别人笑我太疯癫，我笑他人看不穿。
不见五陵豪杰墓，无花无酒锄作田。', '明');
INSERT INTO test.poem (id, name, author, content, period) VALUES (10, '谏逐客书', '李斯', '臣闻吏议逐客，窃以为过矣。昔穆公求仕，西取由余于戎，东得百里奚于宛，迎蹇叔于宋，来丕豹、公孙支于晋。此五子者，不产于秦，而穆公用之，并国二十，遂霸西戎。孝公用商鞅之法，移风易俗，民以殷盛，国以富强，民以乐用，诸侯亲服，获楚、魏之师，举地千里至今治强。惠王用张仪之计，拔三川之地，西并川蜀，北收上郡，南取汉中，包九夷，制鄢郢，东据成皋之险，割膏腴之壤，遂散六国之从，使之西面事秦，功施到今。昭王得范雎，废穰侯，逐华阳，强公室，杜私门，蚕食诸侯，使秦成帝业。此四君者，皆以客之功。由此观之，客何负于秦哉！向使四君却客而不内，疏士而不用，是使国无富利之实，而秦无强大之名也。

今陛下致昆山之玉，有随和之宝，垂明月之珠，服太阿之剑，乘纤离之马，建翠凤之旗，树灵鼍之鼓。此数宝者，秦不生一焉，而陛下说之，何也？必秦国之所生然后可，则是夜光之璧，不饰朝廷；犀象之器，不为玩好；郑、卫之女不充后宫，而骏良駃騠不实外厩，江南金锡不为用，西蜀丹青不为采。所以饰后宫，充下陈，娱心意，说耳目者，必出于秦然后可，则是宛珠之簪，傅玑之珥，阿缟之衣，锦绣之饰不进于前，而随俗雅化，佳冶窈窕，赵女不立于侧也。夫击瓮叩缶弹筝搏髀，而歌呼呜呜快耳者，真秦之声也；郑卫桑间、韶虞、武象者，异国之乐也。今弃击瓮叩缶而就郑卫，退弹筝而取韶虞，若是者何也？快意当前，适观而已矣。今取人则不然。不问可否，不论曲直，非秦者去，为客者逐。然则是所重者在乎色乐珠玉，而所轻者在乎人民也。此非所以跨海内、制诸侯之术也。

臣闻地广者粟多，国大者人众，兵强则士勇。是以太山不让土壤，故能成其大；江河不择细流，故能成其深；王不却众庶，故能明其德。是以地无四方，民无异国，四时充美，鬼神降福，此五帝三王之所以无敌也。今乃弃黔首以资敌国，却宾客以业诸侯，使天下之士退而不敢西向，裹足不入秦，此所谓“藉寇兵而赍盗粮”者也。

夫物不产于秦，可宝者多；士不产于秦，而愿忠者众。今逐客以资敌国，损民以益雠，内自虚而外树怨于诸侯，求国无危，不可得也。', '秦');
INSERT INTO test.poem (id, name, author, content, period) VALUES (11, '山坡羊·潼关怀古', '张养浩', '峰峦如聚，波涛如怒，山河表里潼关路。望西都，意踌躇。

伤心秦汉经行处，宫阙万千都做了土。兴，百姓苦；亡，百姓苦！

峰峦如聚：群峰聚集，层峦叠嶂；  波涛如怒：黄河的波涛汹涌澎湃。

山河表里：即表里山河，形容潼关一带地势险要。表里 即内外 指潼关外有大河 内踞群山

西都：指长安 泛指秦汉以来在长安附近所建的都城，秦和西汉建都西安 东汉建都洛阳 所以洛阳称东都 长安为西都。

', '元');
INSERT INTO test.poem (id, name, author, content, period) VALUES (12, '寡人之于国也', '孟子', '梁惠王曰：“寡人之于国也，尽心焉耳矣。河内凶，则移民于河东，移其粟于河内；河东凶亦然。察邻国之政，无如寡人之用心者。邻国之民不加少，寡人之民不加多，何也？”

孟子对曰：“王好战，请以战喻。填然鼓之，兵刃既接，弃甲曳兵而走。或百步而后止，或五十步而后止。以五十步笑百步，则何如？”
曰：“不可，直不百步耳，是亦走也。” 曰：“王知如此，则无望民之多于邻国也。”

“不违农时，谷不可胜食也；数罟不入洿池，鱼鳖不可胜食也；斧斤以时入山林，材木不可胜用也。谷与鱼鳖不可胜食，鱼鳖不可胜用，是使民养生丧死无憾，王道之始也。“五亩之宅，树之以桑，五十者可以衣帛矣。鸡豚狗彘之畜，无失其时，七十者可以食肉矣。百亩之田，勿夺其时，数口之家可以无饥矣；谨庠序之教，申之以孝悌之义，颁白者不负戴于道路矣。七十者衣帛食肉，黎民不饥不寒，然而不王者，未之有也。” 狗彘食人食而不知检，涂有饿莩而不知发，人死，则曰：‘非我也，岁也。’ 是何异于刺人而杀之，曰,非我也，兵也。王无罪岁，斯天下之民至焉。

梁惠王：战国时期魏国国君，魏罃 因都城在大梁 所以魏惠王又称为梁惠王  寡人：寡德之人 古代君主对自己的谦称
河内：古代人以中原为中心 所以把今河南境内黄河以北成为河内 黄河以南称为河外。河东 ：山西省境内黄河自北向南所以以东为河东
数罟不入洿池：这是为了防止破坏鱼的生长和繁殖。数，cù，密。罟，gǔ，网。洿，wū，深。

谨：谨慎这 里指认真从事   庠序：古代的乡学 xiánɡ  《礼记?学记》：“古之教者，家有塾，党有庠，术有序，国有学。“家”，这里指“闾”，二十五户人共住一巷称为闾。塾，闾中的学校。党，五百户为党。庠，设在党中的学校。术，同“遂”，一万二千五百家为遂。序，设在遂中的学校。国，京城。学，大学。庠，xiánɡ。 教 教化   孝悌：敬爱父母 和兄长。悌，tì。    义：道理   黎民：百姓

王：这里用作动词，为王，称王，也就是使天下百姓归顺。  饿莩：饿死的人。莩，piǎo，同“殍”，饿死的人。
', '战国');
INSERT INTO test.poem (id, name, author, content, period) VALUES (13, '岳阳楼记', '范仲淹', '庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废俱兴。乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属予作文以记之。

       予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯；朝晖夕阴，气象万千。此岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情。得无异乎？

       若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空；日星隐耀，山岳潜形，商旅不行，樯倾楫摧；薄暮冥冥，虎啸猿啼。登斯楼也，则有去国还乡，忧谗畏讥，满目萧然，感激而悲者矣。

       致若春和景明，波澜不惊，上下天光，一碧万顷；沙鸥翔集，锦鳞游泳；岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱皆忘，把酒临风，其喜洋洋者矣。

       嗟夫！予尝求古仁人之心，或异二者之为。何哉？不以物喜，不以己悲；居庙堂之高则忧其民；处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰，“先天下之忧而忧，后天下之乐而乐”乎。噫！微斯人，吾谁与归？

      时六年九月十五日。

制：规模  横无际涯：宽阔无边。横 广远  际涯：边   际 专指陆地的边界 涯 专指水的边界
迁客：谪迁的人  ', '北宋');