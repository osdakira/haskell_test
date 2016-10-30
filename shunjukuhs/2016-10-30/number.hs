-- モジュールNumbersを定義せよ
-- モジュールNumbersのなかで整数値one, two, threeを定義せよ
-- 整数値eightをtwo ^ threeで定義せよ
-- エクスポートリストで明示的にoneとeightだけを指定せよ
-- 対話環境で読みこみまずはone, two, three, eightのすべてにアクセスできることを確認せよ
-- :m Numbersとしてtwoとthreeにはアクセスできないことを確認せよ

module Number (one, eight) where

one = 1
two = 2
three = 3

eight = two ^ three
