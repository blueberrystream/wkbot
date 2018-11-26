module.exports = (robot) ->
  getWeapons = () ->
    fs = require 'fs'
    json = fs.readFileSync 'json/weapons.json'
    json = JSON.parse json
    json.weapons

  robot.hear /^(ブキランダム|ランダムブキ|weapons? random|random weapons?)$/i, (res) ->
    weapon = res.random getWeapons()
    if weapon?
      robot.adapter.sendMessage res.message.user.id, "#{weapon.name} (#{weapon.subWeapon} / #{weapon.special})"
    else
      res.send 'ごめん、わかんない'

  robot.respond /全ブキ/, (res) ->
    weapons = getWeapons()
    response = ''
    weapons.forEach (weapon) ->
      response += "#{weapon.name} (#{weapon.subWeapon} / #{weapon.special})\n"
    robot.adapter.sendMessage res.message.user.id, response
