--Start
 do
    local function run(msg, matches)
        local data = load_data(_config.moderation.data)
  if matches[1]== "addsup" and is_sudo(msg) then
   
local chk =  data["support"] 
  if chk then
  data["support"]["id"] = msg.chat_id_
    save_data(_config.moderation.data, data)
  return "�ǁ��� ������ ��"
  else 
  data["support"] = {id = msg.chat_id_}
    save_data(_config.moderation.data, data)
  return "�ǁ��� ����� ��"
  end
    
  end

  if matches[1] == 'support' then
  local support = data["support"]["id"]
  if support then
        local linkgp = data[tostring(support)]['settings']['linkgp']
    if not linkgp then 
    return "��� ���� ����� ���� ���"
       end
    local text = "Support Group link:\n"..linkgp
      tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    else
    return '���� �ǁ��� ���� �����.'
    end
  end
end

return {
    patterns = {
    "^[!/#](support)$",
  "^[!/#](addsup)$",
  
     },
    run = run
}
end
--End by @Tele_Sudo
--Thanks @To0fan
--channel @luaError