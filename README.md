# Lucene.Net.Analysis.Kuromoji-UniDic
Lucene.Net.Analysis.Kuromojiで使用可能なUniDic辞書ファイルを作成します。

## 手順

1. unidicフォルダにUniDicのFullデータの中身を入れる。
2. Lucene.NetをCloneしてlucene-cli.exeをビルドする。
3. Build-UniDic.ps1の中を開いてlucene-cli.exeのフルパスを記入する。
4. Build-UniDic.ps1を実行する。

unk.defのカラムが足りなかったので足して実行することでエラーを回避します。

最後のビルドコマンド実行は、処理が完了してもcmdから返ってこないことがあるので必要な9ファイルが出力されたら閉じてよい。
