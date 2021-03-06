remote = require 'net.box'
fiber = require 'fiber'
test_run = require('test_run').new()

-- #594: bad argument #1 to 'setmetatable' (table expected, got number)
box.schema.func.create('dostring')
box.schema.user.grant('guest', 'execute', 'function', 'dostring')
test_run:cmd("setopt delimiter ';'")
function gh594()
    local cn = remote.connect(box.cfg.listen)
    local ping = fiber.create(function() cn:ping() end)
    cn:call('dostring', {'return 2 + 2'})
    cn:close()
end;
test_run:cmd("setopt delimiter ''");
gh594()
box.schema.func.drop('dostring')
