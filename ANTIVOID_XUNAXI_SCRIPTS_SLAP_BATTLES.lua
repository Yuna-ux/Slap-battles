--ANTIVOID XUNAXI_SCRIPTS
local antivoid = game.Workspace:FindFirstChild("antivoid")
if antivoid then
    antivoid.Position = Vector3.new(15, -17, 41.5)
    antivoid.CanCollide = true
else
    warn("Barreira não encontrado no Workspace!")
end
