addEventHandler('onClientRender', root, function()
  renderHUD()
  verifyStats()
  setElementData(localPlayer, "oldHealth", getElementHealth(localPlayer))
  setElementData(localPlayer, "oldArmor", getPedArmor(localPlayer))
end)

addEventHandler('onClientResourceStart', root, function()
  local components = {'radar', 'ammo', 'area_name', 'armour', 'clock', 'health', 'breath', 'vehicle_name', 'weapon', 'radio', 'wanted', 'money'}
  for _, component in ipairs(components) do
    setPlayerHudComponentVisible(component, false)
  end
end)