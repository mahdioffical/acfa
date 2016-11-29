do   
local fwd_to = 1052340059
local function callback_message(extra,success,result)
local receiver = result.to.id
local msg = extra
  if result.fwd_from then
sleep(4)
  send_msg(result.fwd_from.id, msg.text, ok_cb,false)
  else
    return nil
      end
  end
local function run(msg, matches)
		  if msg.to.type == "user" then
fwd_msg("channel#id"..tonumber(fwd_to), msg.id,ok_cb,false)
 elseif msg.text and msg.reply_id and tonumber(msg.to.id) == fwd_to then
   if not msg.text and msg.media then
    return "نمیتونم این کار رو انجام بدم."
      end
    get_message(msg.reply_id, callback_message, msg)
return "پیام با موفقیت ارسال شد!"
    end
end
local function run(msg)
  if not msg.text and msg.media then
    msg.text = '['..msg.media.type..']'
  end
  return msg
end
-- functions sleep time
function sleep(n)
  local t = os.clock()
  while os.clock() - t <= n do
  end
end
return {               
patterns = {
"(.*)",
	"%[(photo)%]",
	"%[(video)%]",
	"%[(audio)%]",
	"%[(contact)%]",
	"%[(webpage)%]",
  },
  run = run,
sleep=sleep,
}
end
