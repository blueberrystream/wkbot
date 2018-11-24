module.exports = (robot) ->
  robot.hear /^(ブキ|武器)ランダム|ランダム(ブキ|武器)|weapons? random|random weapons?$/i, (res) ->
    fs = require 'fs'
    json = fs.readFileSync 'json/weapons.json'
    json = JSON.parse json
    weapon = res.random json.weapons
    res.send "#{weapon.name} (#{weapon.subWeapon} / #{weapon.special})"
