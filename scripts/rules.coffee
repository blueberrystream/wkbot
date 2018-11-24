module.exports = (robot) ->
  robot.hear /^ルールランダム|ランダムルール|rules? random|random rules?$/i, (res) ->
    rules = ['ナワバリ', 'ガチエリア', 'ガチヤグラ', 'ガチホコ', 'ガチアサリ']
    index = Math.floor(Math.random() * rules.length)
    res.send rules[index]
