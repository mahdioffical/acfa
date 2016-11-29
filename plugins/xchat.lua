
local function chat(msg,matches)
if msg.text and msg.from.type == "user" then
if matches[1] == "/set" and is_sudo(msg) then
local hash = "chat:"..matches[2]
redis:set(hash,matches[3])
return "اضافه شد !"
end
local hash = "chat:"..msg.text:match("(.*)")
if redis:get(hash) then
sleep(2)
return redis:get(hash)
end
local url = "http://chatter.iteam-co.ir/fa.php?text="..URL.escape(msg.text)
local res = http.request(url)
local j = json:decode(res)
send_typing("user#id"..msg.to.id,ok_cb,false)
sleep(2)
return j.response
end
return {
patterns = {'^(/set) "(.*)" "(.*)"',"(.*)"},
run=chat
}
end
