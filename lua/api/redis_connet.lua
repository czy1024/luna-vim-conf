-- 引入
local redis = require('api.redis_pool'):new({  
    ip = "106.14.30.12",  
    password = "czy1024"  
})
-- 初始化连接池
redis:init_pipeline()

-- 写入数据
redis:rpush("cache_key", 1)
redis:rpush("cache_key", 2)
redis:rpush("cache_key", 3)
-- 其他命令可以照猫画虎
-- 命令从官网 https://redis.io/ 自行查询，参数跟在后边即可

-- 提交管道批量操作
local results, err = redis:commit_pipeline()
-- 没有返回结果时，请检查是否有错误发生
if not results then
    ngx.log(ngx.ERR, "cache failed, ", err)
else
    -- 这里获取结果，下标从 1 开始，依次获取到结果
    ngx.say("cache item 1 = ", results[1])
    ngx.say("cache item 2 = ", results[2])
    ngx.say("cache item 3 = ", results[3])
end