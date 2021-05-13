local request_method = ngx.var.request_method
local args = nil
local form = nil
local body = nil
local json = require("cjson")
-- 1、获取参数的值 获取前端提交参数
if "GET" == request_method then
    args = ngx.req.get_uri_args()
elseif "POST" == request_method then
    ngx.req.read_body()
    args = ngx.req.get_uri_args()
    ngx.req.read_body()
    body = ngx.req.get_body_data()
    form = ngx.req.get_post_args()
end
local operation = args["operation"]
local key = args["key"]
local value = args["value"]
local time = args["time"]

local host = nil
local password = nil

if form then
    for k, v in pairs(form) do
        args[k] = v
    end
    host = args["host"]
    password = args["password"]
end

if host == nil or password == nil then
    local str = json.decode(body);
    host = str.host;
    password = str.password;
end
if operation == nil then
    local result = json.encode({
        code = '0',
        message = 'fail',
        data = 'no operation set'
    })
end

-- 引入
local redis = require('api.redis_pool'):new({
    ip = host,
    password = password
})
-- 初始化连接池
redis:init_pipeline()

-- 数据操作
if operation == "get" then
    return redis:get(key)
else
    redis:set(key, value)
    redis:expire(key, time)
end
-- redis:rpush("cache_key", 1)
-- redis:rpush("cache_key", 2)
-- redis:rpush("cache_key", 3)
-- 其他命令可以照猫画虎
-- 命令从官网 https://redis.io/ 自行查询，参数跟在后边即可

-- 提交管道批量操作
local results, err = redis:commit_pipeline()
-- 没有返回结果时，请检查是否有错误发生

if not results then
    local result = json.encode({
        code = '0',
        message = 'connect fail',
        data = ''
    })
    ngx.say(result);
else
    local result = json.encode({
        code = '0',
        message = 'success',
        data = results
    })
    ngx.say(result);
end
