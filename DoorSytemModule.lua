
-- Não recomendo este código para usarem no vosso jogo, escrevi este código apenas para ajudar-vos a compreender mais a Lógica de fazer um código(não digo que seja a melhor lógica/forma de o fazerem.).
-- Basicamente este código iria abrir uma porta, com Efeitos Sonoros, e Troca de Luzes. O Module em si não vai executar este código, seria necessario usar um Script ou LocalScript e chamar a função door.Open()
-- Qualquer coisa que achem que devia Adicionar/Remover/Trocar a este dirétorio mandem-me na DM pelo Discord: pinx#5289


--[[
  Referências:

1. https://create.roblox.com/docs/reference/engine/classes/ModuleScript
2. https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
3. https://create.roblox.com/docs/education/coding-4/intro-to-for-loops
4. https://create.roblox.com/docs/education/coding-5/intro-to-arrays
5. https://create.roblox.com/docs/education/coding-5/loops-and-arrays
6. https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
7. https://create.roblox.com/docs/reference/engine/datatypes/Instance
]]

local door = {}


-- Defenir as Variaveis. (Esta parte não é muito importante para vocês, pois isto vai servir apenas para ajudar-vos a aprender mais sobre Module e Loops For. E provavelmente ja sabes defenir uma variavel... Se não souberes, nem devias estar aqui a ler isto, isto serve apenas para pessoas que ja estão em um nivel de code write um pouco acima.)
local door_Model = script.Parent
local door_Motor = door_Model.Parent.Motor
local door_DigitalThing = door_Model.Digital
local door_Scan = door_DigitalThing.ClickDetector
local door_Color = door_Model.Color
local door_debounce = false 

function door.Open() --Criar uma função no Module Script, que vai fazer com que possamos usar essa função em outro Script usando "require()"
	
	
	if door_debounce == false then -- Se o Debounce for "false" signfica que o código tem permissão para continuar, para evitar que o Player dê "spam" na função. o Debounce na linha embaixo foi setado como "true" para o impossibilitar o código rodar novamente.
		door_debounce = true
		local soundEletric = Instance.new("Sound") -- Aqui ciramos uma Instancia Sound, que vamos usar para dar Efeitos Sonoros à porta. Mais sobre Instancias nas referencias acima.
		soundEletric.RollOffMaxDistance = 1000
		soundEletric.SoundId = "rbxassetid://10918433784"
		soundEletric.Parent = door_DigitalThing
		local soundMechanicOpen = Instance.new("Sound")
		soundMechanicOpen.RollOffMaxDistance = 1000
		soundMechanicOpen.SoundId = "rbxassetid://4381793351"
		soundMechanicOpen.Parent = door_DigitalThing -- Aqui colocamos o objeto "Sound" como filho do modelo, para conseguir-mos ouvir os Sons.
		local soundMechanicClose = Instance.new("Sound")
		soundMechanicClose.RollOffMaxDistance = 1000
		soundMechanicClose.SoundId = "rbxassetid://9116323566"
		soundMechanicClose.Parent = door_DigitalThing
		soundEletric:Play()
		soundEletric.Ended:Wait()
		soundMechanicOpen:Play()
		door_Color.BrickColor = BrickColor.new("Lime green")
		task.wait(1.5)
		door_Motor.HingeConstraint.TargetAngle = 90
		task.wait(3)
		door_Motor.HingeConstraint.TargetAngle = 180
		task.wait(2.5)
		soundMechanicClose:Play()
		door_Color.BrickColor = BrickColor.new("Really red")
		soundMechanicClose.Ended:Wait() -- Aqui usamos o sound.Ended:Wait(). Isto é simples, o Código vai dar um Pause até que o Som termine.
		local childs = door_DigitalThing:GetChildren() -- Aqui pegamos todos os filhos usando o :GetChildren() que vai returnar uma Array com todos os Filhos/Childrens do Modelo/Part.
		for i = 1, #childs do
			if childs[i].ClassName == "Sound" then
				childs[i]:Destroy() -- Se sabes de Loops For, aqui podes ver que pegamos os Childs do Modelo que adicionamos os Sounds, e verifcamos se a ClassName é "Sound", e em seguida apagamos o Sound. Se não sabes sobre Loops For, vê as referências no topo.
			end
		end
		door_debounce = false -- Como a Porta nesta altura do código já fechou, o Debounce foi setado como "false" para o código poder rodar novamente, e assim abrir a porta novamente.
	end
	
end

return door



