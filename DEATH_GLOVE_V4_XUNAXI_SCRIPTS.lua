-- Verificando o ID da Place antes de executar o loadstring
if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 then
    -- Carregando e executando o script apenas se o ID da Place for válido
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/DEATH_GLOVE_V4_SLAP_AURA_MADE_BY_XUNAXI_SCRIPTS.lua"))();
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RAFA12763/Scripts/refs/heads/main/Animation_slap_battles_free.lua"))();   
    loadstring(game:Httpget("https://raw.githubusercontent.com/Donjosx/General/refs/heads/main/Hookmetamethod.lua"))();
else
    -- Caso o ID da Place não seja um dos especificados, o código não será executado
    print("Este script não será executado nesta place.")
end
