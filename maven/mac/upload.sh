
#安装gpg
brew install gpg
#生成key
gpg --gen-key
#输入对应信息
Real name: 
Email address: 

#查询生成的公钥的信息
gpg --list-keys

---------------------------------
pub   rsa2048 2019-05-30 [SC] [expires: 2021-05-29]
      B619ABB4B37B166061CD17352FCF6A922383XXXX
uid           [ultimate] rxyor <rxyor@outlook.com>
sub   rsa2048 2019-05-30 [E] [expires: 2021-05-29]

#上传到密钥服务器
gpg --keyserver hkp://keyserver.ubuntu.com:11371 --send-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216
gpg: sending key 2FCF6A922383D13B to hkp://keyserver.ubuntu.com:11371

#查询密钥是否上传成功
gpg --keyserver hkp://keyserver.ubuntu.com:11371 --recv-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216
gpg: key 2FCF6A922383D13B: "rxyor <rxyor@outlook.com>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1

gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216

mvn versions:set -DnewVersion=1.0.0

mvn clean deploy -P ossrh  -Dmaven.test.skip=true -Darguments=gpg.passphrase="luna"

mvn versions:set -DnewVersion=1.0-SNAPSHOT

mvn clean deploy -P ossrh  -Dmaven.test.skip=true

gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216
gpg --keyserver hkp://keyserver.ubuntu.com:11371 --send-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216


gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216
gpg --keyserver hkp://keyserver.ubuntu.com:11371 --recv-keys 88CF1DCE4886FB27E66F9ACFE653B2F836E0A216
