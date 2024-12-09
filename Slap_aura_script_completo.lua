-- Carregando os scripts externos com loadstring
local slapAuraScript = game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/SLAP_AURA_MADE_BY_XUNAXI_SCRIPTS.lua")
local buttonsScript = game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/BOTÕES_SLAP_AURA_XUNAXI.lua")
local antiVoidScript = game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/ANTIVOID_XUNAXI_SCRIPTS_SLAP_BATTLES.lua")

-- Executando os scripts
loadstring(slapAuraScript)()
loadstring(buttonsScript)()
loadstring(antiVoidScript)()
