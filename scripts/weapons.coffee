module.exports = (robot) ->
  getWeapons = () ->
    fs = require 'fs'
    json = fs.readFileSync 'json/weapons.json'
    json = JSON.parse json
    json.weapons

  robot.hear /^(ブキランダム|ランダムブキ|weapons? random|random weapons?)( +)?(.*)$/i, (res) ->
    needle = res.match[3]
    weapons = getWeapons()

    if needle? && needle.length isnt 0
      weapons = weapons.filter (weapon) ->
        weapon.category is needle || weapon.subWeapon is needle || weapon.special is needle

    weapon = res.random weapons
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
