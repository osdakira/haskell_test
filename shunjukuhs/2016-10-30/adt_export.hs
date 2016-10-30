    -- モジュールAnpanmanを作成し型Friendを定義せよ
    --     型Friendは値構築子Friendをもつ
    --     値構築子Friendは文字列を引数としてもつ
    --     deriving Showをしておく
    -- 値ai, yuukiを定義せよ
    --     値aiは文字列"Ai"をもつFriend型の値
    --     値yuukiは文字列"Yuuki"をもつFriend型の値
    -- エクスポートリストを明示して型Friend、値ai、yuukiだけを指定せよ
    --     値構築子Friendは公開しない
    -- 対話環境に読みこめ
    --     まずはモジュール内ではaiとyuuki以外のFriendも作れることを確認する
    --     明示的に:m Anpanmanとしてモジュールの外に出よ
    --     aiとyuukiだけがFriendであることを確認せよ

import Anpanman

-- Friend "Kibou"

main = do
  print $ ai
  print $ yuuki
