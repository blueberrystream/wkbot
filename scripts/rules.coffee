module.exports = (robot) ->
  robot.hear /^ルールランダム|ランダムルール|rules? random|random rules?$/i, (res) ->
    rules = ['ナワバリ', 'ガチエリア', 'ガチヤグラ', 'ガチホコ', 'ガチアサリ']
    res.send res.random rules
