Script = [[
--this is where the hecking script goes
]]

customVarNames = {
  "ii1111iiliiill1l11lli1illllllliiil11i1l1i11l1liliil1i1ii11iii1ii11i1iiilliliiilll1l1li11ili11l1i1il1",
  "lilil11llli1ili1l1i1l11i11lii1llliiiillii11i111l1ii11i1l1i1i1iil1il111ili1lli1li1i1ii1l1l1lil1iiliii",
  "l1ii1lli1iil11iii1iii11l1i1iiilll1lilliilii1l11illiii111i1llii1l111ll111illi1i1lli1ll1il11iii11ii1li",
  "iliilili1llllli1lili1llil1lilllill1ii1i1il1ll1l1i11i11ilillil1iili1iil1iii1i11illl1li1ii1li1i1l11iil",
  "iiilllilii1llll1ii1ilill11ill1ii111l1l1lii1lll1ii1l1ill1ill1111iillil1l1llli1llll11llililii1iiil1li1",
  "l1iii1illl11ii1l1iiil111l1llliiii11l1lllllili11iilii1illllill1l1ii1l1i11li1iilll1il1l11illi1li1i1li1",
  "iii11ill1lilii1illli1ll1liiiiii1ll1ill1i1liliiiii1i1illiilli11ii111lill11il11ill11i1lilili1l1l1liii1"
}

funcrename = {
  ["print"]="print",
  ["_G"]="_G",
  ["getmetatable"]="getmetatable",
  ["setmetatable"]="setmetatable",
  ["game"]="game",
  ["HttpGet"]="HttpGet",
  ["HttpGetAsync"]="HttpGetAsync",
  ["GetObjects"]="GetObjects",
  ["debug"]="debug",
  ["warn"]="warn",
  ["error"]="error",
  ["Instance.new"]="Instance.new",
  ["loadstring"]="loadstring",
  ["UDim2.new"]="UDim2.new",
  ["false"]="false",
  ["true"]="true",
  ["Color3.new"]="Color3.new",
  ["Vector3.new"]="Vector3.new",
  ["Vector2.new"]="Vector2.new",
  ["getgenv"]="getgenv",
  ["getrenv"]="getrenv",
  ["getfenv"]="getfenv",
  ["getsenv"]="getsenv",
  ["Enum"]="Enum",
  ["getrawmetatable"]="getrawmetatable",
  ["setrawmetatable"]="setrawmetatable",
  ["newcclosure"]="newcclosure",
  ["CFrame.new"]="CFrame.new",
  ["next"]="next",
  ["pairs"]="pairs",
  ["Region3.new"]="Region3.new",
  ["nil"]="nil",
  ["printidentity"]="printidentity",
  ["tostring"]="tostring",
  ["unpack"]="unpack",
  ["debug"]="debug",
  ["bit"]="bit",
  ["string.char"]="string.char"
}

local chars ="1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1"
local taken = { }
taken[""] = true
local function CreateVar()
  local s = ""
  while taken[s] do
    for i = 1, math.random(5, 10) do
      local c = chars:sub(i,i)
      s = s..c
    end
  end
  taken[s] = true
  return(customVarNames[math.random(1,#customVarNames)].. s)
end

--WipeComments
function WipeComment(scr)
  scr = scr:gsub("(%-%-%[(=*)%[.-%]%2%])", "")
  scr = scr:gsub("(%-%-[^\r\n]*)", "")
  return scr
end

--WipeStrings
local mamadouseydou = CreateVar()
local mamadouseydou0 = CreateVar()
local mamadouseydou1 = CreateVar()
local GenStr = function(Str)
    local R = {}
    local Ran = function(n)
        local r = math.random(1, 255)
        return ((n - r)/6).. ' + ' ..(r/6)
    end

    for c in Str:gmatch('.') do
        table.insert(R, Ran(c:byte()))
    end

    return "{"..table.concat(R, ', ').."}"
end



local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
characters={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","`","~","!","@","#","$","%","^","&","*","(",")","-","=","_","+"," ","[","{","]","}","\\","|","'","\"",";",":",",","<",".",">","/","?"," ","\n"}

function enc(data)
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

function Encode(str)
local multiplier = 7
  String_Characters = {}
  for i=1,str:len() do
    table.insert(String_Characters, str:sub(i,i))
  end

  return_chars = ""

  for i,v in pairs(String_Characters) do
    for p,m in pairs(characters) do
      if (v == m) then
        local num = p * multiplier
        return_chars = return_chars..enc(tostring(num)).."/"
        end
      end
    end

    return return_chars
end

function Decode(str)
local multiplier = 7
local Numerical_Characters = {}
for num in string.gmatch(str, '([^/]+)') do
    table.insert(Numerical_Characters, num)
end

  local return_chars = ""

  for p,m in pairs(Numerical_Characters) do
    local a = tonumber(m/multiplier)
    for b in string.gmatch(tostring(a), "[^%.]+") do
    if (b ~= "0") then
      return_chars = return_chars..characters[tonumber(b)]
      end
  end
    end

return return_chars
end



function WipeStrings(scrpt)
  for each in scrpt:gmatch("%b''") do
    scrpt = scrpt:gsub(each, each:gsub("'", '"'))
  end
  for each in scrpt:gmatch('%b""') do
    each = each:gsub('"', '')
    scrpt = scrpt:gsub('"'..each..'"', "(Decode(\""..Encode(each).."\"))")
  end

  return scrpt
end


--CoreFuncRename
function CFR(scrpt)
  for i,v in pairs(funcrename) do
    local pp = CreateVar()
    funcrename[i]= pp
  end
  local setlist = ""
  for i,v in pairs(funcrename) do
    setlist = setlist..("local "..v.."="..i.."; ")
    scrpt = scrpt:gsub(i, v)
  end
  return(setlist..scrpt)
end

--LocalFuncRename
local library = {}
function LFR(scrpt)
  for fType in scrpt:gmatch("local%s*function%s*([%w_]+)%(") do
		local replacement = CreateVar()
		if #fType > 5 then
			library[fType] = replacement
			scrpt = scrpt:gsub("function " .. fType, "function " .. replacement)
		end
	end

	for fCall in scrpt:gmatch("([%w_]+)%s*%(") do
		if library[fCall] then
			scrpt = scrpt:gsub(fCall .. '%(', library[fCall] .. '%(')
		end
	end
  return scrpt
end

--NonLocalFuncRename
function NLFR(scrpt)
  for fType in scrpt:gmatch("%s*function%s*([%w_]+)%(") do
    local replacement = CreateVar()
		if #fType > 5 then
			library[fType] = replacement
			scrpt = scrpt:gsub("function " .. fType, "function " .. replacement)
		end
	end

  for fCall in scrpt:gmatch("([%w_]+)%s*%(") do
		if library[fCall] then
			scrpt = scrpt:gsub(fCall .. '%(', library[fCall] .. '%(')
		end
	end
  return scrpt
end

--RemoveWhitespace
function RW(scrpt)
  scrpt = scrpt:gsub("^%s*(.-)%s*$", "%1")
  scrpt = scrpt:gsub("(^%s*).*", "")
  scrpt = scrpt:gsub(" %s+", " ")
  scrpt = scrpt:gsub(";%c+","; ")
  return scrpt
end

--VarRename

function isKeyword(s)
  local s2 = 'and break do else elseif end false for function if in local nil not or repeat return then true until'
  for w in s2:gmatch("(%w+)") do
    if w == s then return true end
  end
  return false
end

function VR(scrpt)
	for each in scrpt:gmatch("local%s*([%w_]*)%s*=%s*") do
    if #each > 3 and not isKeyword(each) then
      local varName = CreateVar()
      scrpt = scrpt:gsub(each," "..varName)
    end
  end
  return scrpt
end

--obfuscate
function Obfuscate(scr)
  scr = WipeComment(scr)
  scr = [[
characters={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","`","~","!","@","#","$","%","^","&","*","(",")","-","=","_","+"," ","[","{","]","}","\\","|","'","\"",";",":",",","<",".",">","/","?"," ","\n"}local i1i1lilii1iiiliilii1ii1iiiiiill1il1i1l1ii1l11i111111lilii1lliil1ii1i1i1liii1iii11iiiiii111l1iiiiliii ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'function ll1ll11i11illii11l1(data)data = string.gsub(data, '[^'..i1i1lilii1iiiliilii1ii1iiiiiill1il1i1l1ii1l11i111111lilii1lliil1ii1i1i1liii1iii11iiiiii111l1iiiiliii..'=]', '')return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(i1i1lilii1iiiliilii1ii1iiiiiill1il1i1l1ii1l11i111111lilii1lliil1ii1i1i1liii1iii11iiiiii111l1iiiiliii:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end function Decode(str) local multiplier = 7 local Numerical_Characters = {} for num in string.gmatch(str, '([^/]+)') do  table.insert(Numerical_Characters, ll1ll11i11illii11l1(num)) end local return_chars = "" for p,m in pairs(Numerical_Characters) do local a = tonumber(m/multiplier) for b in string.gmatch(tostring(a), "[^%.]+") do if (b ~= "0") then return_chars = return_chars..characters[tonumber(b)] end end end return return_chars end  ]]..scr
  scr = LFR(scr)
  scr = NLFR(scr)
  scr = VR(scr) -- Replaces things with matching strings! (breaks scripts!)
  scr = CFR(scr)
  print(scr)
end

do Obfuscate(WipeStrings(Script)) end
