local _M = {}
-- 获取http get/post 请求参数
function _M.getArgs()
    -- 获取http请求方式 GET or POST
    local request_method = ngx.var.request_method
    -- 这里是一个table，包含所有get请求参数
    local args = ngx.req.get_uri_args()
    -- 如果是post参数获取
    if "POST" == request_method then
        -- 先读取请求体
        ngx.req.read_body()
        -- 这里也是一个table，包含所有post请求参数
        local postArgs = ngx.req.get_post_args()
        if postArgs then
            for k, v in pairs(postArgs) do
                args[k] = v
            end
        end
    end
    return args
end

function _M.getHeader()
    local headerArgs = ngx.req.get_headers()
    if headerArgs then
        for k, v in pairs(headerArgs) do
            args[k] = v
        end
    end
    return args
end

return _M
