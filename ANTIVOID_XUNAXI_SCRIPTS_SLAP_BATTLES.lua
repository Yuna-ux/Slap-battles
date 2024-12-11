-- DED BARRIER XUNAXI_SCRIPTS
local dedBarrier = game.Workspace:FindFirstChild("dedBarrier")

if dedBarrier then
    -- Modificar a posição e as propriedades do objeto
    dedBarrier.Position = Vector3.new(15, -17, 41.5)
    dedBarrier.CanCollide = true
else
    warn("Barreira 'dedBarrier' não encontrada no Workspace!")
end
