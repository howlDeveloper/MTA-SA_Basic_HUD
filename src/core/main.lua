local tick = getTickCount()
local health = 0
local armor = 0
local initialHealth = health
local finalHealth = health
local initialArmor = armor
local finalArmor = armor
local changeHealth = 0
local atualHealth = changeHealth

function verifyStats()
  local atualHealth = getElementHealth(localPlayer)

  if (getElementData(localPlayer, 'oldHealth') ~= atualHealth) then
    tick = getTickCount()
  end

  if (getElementData(localPlayer, 'oldArmor') ~= atualHealth) then
    tick = getTickCount()
  end
end

function renderHUD()
  local h, m = getTime()
  health = interpolateBetween(initialHealth, 0, 0, finalHealth, 0, 0, (getTickCount() - tick) / 1000, 'Linear')
  initialHealth = health
  finalHealth = getElementHealth(localPlayer)
  armor = interpolateBetween(initialArmor, 0, 0, finalArmor, 0, 0, (getTickCount() - tick) / 1000, 'Linear')
  initialArmor = armor
  finalArmor = getPedArmor(localPlayer)

  if string.len(h) == 1 then
    h = '0'..h  
  end

  if string.len(m) == 1 then
    m = '0'..m  
  end
  dxDrawImage(1680, 1000, 50, 50, toSVG['cube'], 0, 0 ,0, tocolor(33, 33, 33, 255))
  dxDrawImageSection(1680, 1050, 50, -health / 2, 0, 0, 50, health / 2, toSVG['cube'],0 ,0 ,0, tocolor(255, 122, 0))
  dxDrawImage(1680 + 9, 1000 + 10, 32, 32, 'assets/heart.png')

  dxDrawImage(1680 + 55, 1000, 50, 50, toSVG['cube'], 0, 0 ,0, tocolor(33, 33, 33, 255))
  dxDrawImageSection(1680 + 55, 1050, 50, -armor / 2, 0, 0, 50, armor / 2, toSVG['cube'],0 ,0 ,0, tocolor(255, 122, 0))
  dxDrawImage(1680 + 55 + 9, 1000 + 10, 32, 32, 'assets/shield.png')

  dxDrawImage(1680 + 55 + 55, 1000, 50, 50, toSVG['cube'], 0, 0 ,0, tocolor(33, 33, 33, 255))
  dxDrawImageSection(1680 + 55 + 55, 1050, 50, 50, 0, 0, 50, 0, toSVG['cube'],0 ,0 ,0, tocolor(255, 122, 0))
  dxDrawImage(1680 + 55 + 55 + 9, 1000 + 10, 32, 32, 'assets/food.png')

  dxDrawImage(1680 + 55 + 55 + 55, 1000, 50, 50, toSVG['cube'], 0, 0 ,0, tocolor(33, 33, 33, 255))
  dxDrawImageSection(1680 + 55 + 55 + 55, 1050, 50, 50, 0, 0, 50, 0, toSVG['cube'],0 ,0 ,0, tocolor(255, 122, 0))
  dxDrawImage(1680 + 55 + 55 + 55 + 9, 1000 + 10, 32, 32, 'assets/water.png')

  dxDrawImageSection(1600, 20, 190, 40, 0, 0, 190, 40, toSVG['rect'], 0, 0, 0, tocolor(33, 33, 33, 255))
  dxDrawText(string.sub(getZoneName(getElementPosition(localPlayer)), 1, 12), 1600, 20, 190, 40, _, _, 'default', 'center', 'center')
  dxDrawImageSection(1680 + 55 + 55 + 55 + 55, 20, -100, 40, 0, 0, 100, 40, toSVG['rect'], 0, 0, 0, tocolor(33, 33, 33, 255))
  dxDrawText(h..":"..m, 1680 + 55 + 55 + 10, 20, 100, 40, _, _, 'default', 'center', 'center')
end