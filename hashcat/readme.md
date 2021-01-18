# Hashcat密码破解

hashcat官网下载：

 https://hashcat.net/hashcat/

### 使用前准备

 环境：ubuntu

 硬件：普通电脑+显卡

 hashcat可以运行，可以用cpu，也可用gpu。使用cpu版本的程序已经停止更新了，而且我也没有运行成功。gpu要安装gpu驱动和opencl环境。

### HashCat软件使用参数

2.1 hashcat使用参数

直接运行hashcat（分为32和64位版本）会提示使用参数：

Usage:hashcat64 [options]… hash|hashfile|hccapxfile [dictionary|mask|directory]…

也即hashcat [选项] 破解的哈希值或hash文件、hccapx文件 [字典|掩码|目录] …

Hccapxfile对应无线包，其对应破解哈希类型为“-m 2500 = WPA/WPA2”。

2.2 查看帮助

使用hashcat –help命令可以获取详细的帮助信息，可以使用hashcat –help>help.txt来参考具体的参数使用帮助。

2.3 选项

（1）普通

> -m, —hash-type=NUM 哈希类别，其NUM值参考其帮助信息下面的哈希类别值，其值为数字。如果不指定m值则默认指md5，例如-m 1800是sha512 [Linux](https://blog.csdn.net/cpongo3/article/GLOSSARY.html#linux)加密。
>
> -a, –attack-mode=NUM 攻击模式，其值参考后面对参数。“-a 0”字典攻击，“-a 1” 组合攻击；“-a 3”掩码攻击。
>
> -V, —version 版本信息
>
> -h, –help 帮助信息。
>
> –quiet 安静的模式, 抑制输出

（2）基准测试

> -b, –benchmark 测试计算机破解速度和显示硬件相关信息

（3）杂项

> –hex-salt salt值是用十六进制给出的
>
> –hex-charset 设定字符集是十六进制给出
>
> –runtime=NUM 运行数秒（NUM值）后的中止会话
>
> –status 启用状态屏幕的自动更新
>
> –status-timer=NUM 状态屏幕更新秒值
>
> –status-automat 以机器可读的格式显示状态视图
>
> –session 后跟会话名称，主要用于中止任务后的恢复破解。
>
> --force 忽略破解过程中的警告信息,跑单条hash可能需要加上此选项

（4）文件

> -o, –outfile=FILE 定义哈希文件恢复输出文件
>
> –outfile-format=NUM 定义哈希文件输出格式，见下面的参考资料
>
> –outfile-autohex-disable 禁止使用十六进制输出明文
>
> -p, –separator=CHAR 为哈希列表/输出文件定义分隔符字符
>
> –show 仅仅显示已经破解的密码
>
> –left 仅仅显示未破解的密码
>
> –username 忽略hash表中的用户名，对[linux](https://blog.csdn.net/cpongo3/article/GLOSSARY.html#linux)文件直接进行破解，不需要进行整理。
>
> –remove 移除破解成功的hash，当hash是从文本中读取时有用，避免自己手工移除已经破解的hash
>
> –stdout 控制台模式
>
> –potfile-disable 不写入pot文件
>
> –debug-mode=NUM 定义调试模式（仅通过使用规则进行混合），参见下面的参考资料
>
> –debug-file=FILE 调试规则的输出文件（请参阅调试模式）
>
> -e, –salt-file=FILE 定义加盐文件列表
>
> –logfile-disable 禁止logfile

（4） 资源

> -c, –segment-size=NUM 字典文件缓存大小（M）
>
> -n, –threads=NUM 线程数
>
> -s, –words-skip=NUM 跳过单词数
>
> -l, –words-limit=NUM 限制单词数(分布式)

（5）规则

> -r, –rules-file=FILE 使用规则文件: -r 1.rule，
>
> -g, –generate-rules=NUM 随机生成规则
>
> –generate-rules-func-min= 每个随机规则最小值
>
> –generate-rules-func-max=每个随机规则最大值
>
> –generate-rules-seed=NUM 强制RNG种子数

（6）自定义字符集

> -1, –custom-charset1=CS 用户定义的字符集
>
> -2, –custom-charset2=CS 例如:
>
> -3, –custom-charset3=CS –custom-charset1=?dabcdef : 设置?1 为0123456789abcdef
>
> -4, –custom-charset4=CS -2mycharset.hcchr : 设置 ?2 包含在mycharset.hcchr

文件

（7）攻击模式

大小写转换攻击:

> –toggle-min=NUM 在字典中字母的最小值
>
> –toggle-max=NUM 在字典中字母的最大值

\* 使用掩码攻击模式:

> –increment 启用增量破解模式,你可以利用此模式让hashcat在指定的密码长度范围内执行破解过程,其实,并不建议这么用,因为破解时间可能会比较长
>
> –increment-min=NUM 密码最小长度,后面直接等于一个整数即可,配置increment模式一起使用
>
> –increment-max=NUM 密码最大长度,同上

\* 排列攻击模式

> –perm-min=NUM 过滤比NUM数小的单词
>
> –perm-max=NUM 过滤比NUM数大的单词

\* 查找表攻击模式:

> -t, –table-file=FILE 表文件
>
>  –table-min=NUM 在字典中的最小字符值
>
>  –table-max=NUM 在字典中的最大字符值

\* 打印攻击模式:

> –pw-min=NUM 如果长度大于NUM，则打印候选字符
>
> –pw-max=NUM 如果长度小于NUM，则打印候选字符
>
> –elem-cnt-min=NUM 每个链的最小元素数
>
> –elem-cnt-max=NUM 每个链的最大元素数
>
> –wl-dist-len 从字典表中计算输出长度分布
>
> –wl-max=NUM 从字典文件中加载NUM个单词，设置0禁止加载。
>
> –case-permute 在字典中对每一个单词进行反转

（8）参考

输出文件格式:

> 1 = hash[:salt]
>
> 2 = plain 明文
>
> 3 = hash[:salt]:plain
>
> 4 = hex_plain
>
> 5 = hash[:salt]:hex_plain
>
> 6 = plain:hex_plain
>
> 7 = hash[:salt]:plain:hex_plain
>
> 8 = crackpos
>
> 9 = hash[:salt]:crackpos
>
> 10 = plain:crackpos
>
> 11 = hash[:salt]:plain:crackpos
>
> 12 = hex_plain:crackpos
>
> 13 = hash[:salt]:hex_plain:crackpos
>
> 14 = plain:hex_plain:crackpos
>
> 15 = hash[:salt]:plain:hex_plain:crackpos

\* 调试模式输出文件 (for hybrid mode only, by using rules):

> 1 = save finding rule
>
> 2 = save original word
>
> 3 = save original word and finding rule
>
> 4 = save original word, finding rule andmodified plain

\* 内置的字符集:

> ?l = abcdefghijklmnopqrstuvwxyz 代表小写字母
>
> ?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ 代表大写字母
>
> ?d = 0123456789 代表数字
>
> ?h = 0123456789abcdef 常见小写字母和数字
>
> ?H = 0123456789ABCDEF 常见大写字母和数字
>
> ?s = !”#$%&’()*+,-./:;<=>?@[]^_`{|}~ 代表特殊字符
>
> ?a = ?l?u?d?s 大小写数字及特殊字符的组合
>
> ?b = 0×00 – 0xff

攻击模式

> （字典破解）
>
> 0 = Straight
>
> （组合破解）
>
> 如果你事先已经明确知道密码中可能包含哪些字符串,你可以把那些字符串事先写到文件中,每行对应一个字符串,然后hashcat会自动根据你所提供的这些字符串,尝试所有可能的组合进行猜解
>
> 1 = Combination
>
> （大小写转换）
>
> 2 = Toggle-Case
>
> （掩码暴力破解，适用于大批量爆破hash）
>
> 3 = Brute-force
>
> （序列破解）
>
> 4 = Permutation
>
> （查表破解）
>
> 5 = Table-Lookup
>
> （字典加掩码破解）
>
> 每次从前面的字典中取出一个字符串然后和后面掩码的所有组合进行拼接,直到撞到对应的明文
>
> 6 = Hybrid dict + mask
>
> （掩码+字典破解）
>
> 跟6的过程正好相反,只不过这次它是从前面进行拼接
>
> 7 = Hybrid mask + dict
>
> （王子破解）
>
> 8 = Prince

\* 哈希类型

有关哈希具体值示例可以参考https://hashcat.net/wiki/doku.php?id=example_hashes

> 0 = MD5
>
> 10 = md5($pass.$salt)
>
> 20 = md5($salt.$pass)
>
> 30 = md5(unicode($pass).$salt)
>
> 40 = md5($salt.unicode($pass))
>
> 50 = HMAC-MD5 (key = $pass)
>
> 60 = HMAC-MD5 (key = $salt)
>
> 100 = SHA1
>
> 110 = sha1($pass.$salt)
>
> 120 = sha1($salt.$pass)
>
> 130 = sha1(unicode($pass).$salt)
>
> 140 = sha1($salt.unicode($pass))
>
> 150 = HMAC-SHA1 (key = $pass)
>
> 160 = HMAC-SHA1 (key = $salt)
>
> 200 = MySQL323
>
> 300 = MySQL4.1/MySQL5
>
> 400 = phpass, MD5(WordPress), MD5(phpBB3),MD5(Joomla)
>
> 500 = md5crypt, MD5(Unix), FreeBSD MD5,Cisco-IOS MD5
>
> 900 = MD4
>
> 1000 = NTLM
>
> 1100 = Domain Cached Credentials (DCC), MSCache
>
> 1400 = SHA256
>
> 1410 = sha256($pass.$salt)
>
> 1420 = sha256($salt.$pass)
>
> 1430 = sha256(unicode($pass).$salt)
>
> 1431 = base64(sha256(unicode($pass)))
>
> 1440 = sha256($salt.unicode($pass))
>
> 1450 = HMAC-SHA256 (key = $pass)
>
> 1460 = HMAC-SHA256 (key = $salt)
>
> 1600 = md5apr1, MD5(APR), Apache MD5
>
> 1700 = SHA512
>
> 1710 = sha512($pass.$salt)
>
> 1720 = sha512($salt.$pass)
>
> 1730 = sha512(unicode($pass).$salt)
>
> 1740 = sha512($salt.unicode($pass))
>
> 1750 = HMAC-SHA512 (key = $pass)
>
> 1760 = HMAC-SHA512 (key = $salt)
>
> 1800 = SHA-512(Unix)
>
> 2400 = Cisco-PIX MD5
>
> 2410 = Cisco-ASA MD5
>
> 2500 = WPA/WPA2
>
> 2600 = Double MD5
>
> 3200 = bcrypt, Blowfish(OpenBSD)
>
> 3300 = MD5(Sun)
>
> 3500 = md5(md5(md5($pass)))
>
> 3610 = md5(md5($salt).$pass)
>
> 3710 = md5($salt.md5($pass))
>
> 3720 = md5($pass.md5($salt))
>
> 3800 = md5($salt.$pass.$salt)
>
> 3910 = md5(md5($pass).md5($salt))
>
> 4010 = md5($salt.md5($salt.$pass))
>
> 4110 = md5($salt.md5($pass.$salt))
>
> 4210 = md5($username.0.$pass)
>
> 4300 = md5(strtoupper(md5($pass)))
>
> 4400 = md5(sha1($pass))
>
> 4500 = Double SHA1
>
> 4600 = sha1(sha1(sha1($pass)))
>
> 4700 = sha1(md5($pass))
>
> 4800 = MD5(Chap), iSCSI CHAP authentication
>
> 4900 = sha1($salt.$pass.$salt)
>
> 5000 = SHA-3(Keccak)
>
> 5100 = Half MD5
>
> 5200 = Password Safe SHA-256
>
> 5300 = IKE-PSK MD5
>
> 5400 = IKE-PSK SHA1
>
> 5500 = NetNTLMv1-VANILLA / NetNTLMv1-ESS
>
> 5600 = NetNTLMv2
>
> 5700 = Cisco-IOS SHA256
>
> 5800 = Android PIN
>
> 6300 = AIX {smd5}
>
> 6400 = AIX {ssha256}
>
> 6500 = AIX {ssha512}
>
> 6700 = AIX {ssha1}
>
> 6900 = GOST, GOST R 34.11-94
>
> 7000 = Fortigate (FortiOS)
>
> 7100 = OS X v10.8+
>
> 7200 = GRUB 2
>
> 7300 = IPMI2 RAKP HMAC-SHA1
>
> 7400 = sha256crypt, SHA256(Unix)
>
> 7900 = Drupal7
>
> 8400 = WBB3, Woltlab Burning Board 3
>
> 8900 = scrypt
>
> 9200 = Cisco $8$
>
> 9300 = Cisco $9$
>
> 9800 = Radmin2
>
> 10000 = Django (PBKDF2-SHA256)
>
> 10200 = Cram MD5
>
> 10300 = SAP CODVN H (PWDSALTEDHASH) iSSHA-1
>
> 11000 = PrestaShop
>
> 11100 = PostgreSQL Challenge-ResponseAuthentication (MD5)
>
> 11200 = MySQL Challenge-Response Authentication(SHA1)
>
> 11400 = SIP digest authentication (MD5)
>
> 99999 = Plaintext
>
> **特殊哈希类型**
>
> 11 = Joomla < 2.5.18
>
> 12 = PostgreSQL
>
> 21 = osCommerce, xt:Commerce
>
> 23 = Skype
>
> 101 = nsldap, SHA-1(Base64), Netscape LDAPSHA
>
> 111 = nsldaps, SSHA-1(Base64), Netscape LDAPSSHA
>
> 112 = Oracle S: Type (Oracle 11+)
>
> 121 = SMF > v1.1
>
> 122 = OS X v10.4, v10.5, v10.6
>
> 123 = EPi
>
> 124 = Django (SHA-1)
>
> 131 = MSSQL(2000)
>
> 132 = MSSQL(2005)
>
> 133 = PeopleSoft
>
> 141 = EPiServer 6.x < v4
>
> 1421 = hMailServer
>
> 1441 = EPiServer 6.x > v4
>
> 1711 = SSHA-512(Base64), LDAP {SSHA512}
>
> 1722 = OS X v10.7
>
> 1731 = MSSQL(2012 & 2014)
>
> 2611 = vBulletin < v3.8.5
>
> 2612 = PHPS
>
> 2711 = vBulletin > v3.8.5
>
> 2811 = IPB2+, MyBB1.2+
>
> 3711 = Mediawiki B type
>
> 3721 = WebEdition CMS
>
> 7600 = Redmine Project Management Web App