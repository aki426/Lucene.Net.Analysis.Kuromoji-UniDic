$input_dir = Join-Path $PWD "unidic"
$output_dir = Join-Path $PWD "kuromoji-data"

$unk_path = Join-Path $input_dir "unk.def"
$old_path = Join-Path $input_dir "unk.def.old"

if (Test-Path $old_path) {
    # 多重実行を防ぐ
    return
}

mv $unk_path $old_path

# 12カラム無いなら12カラムまでアスタリスクを足せばいいじゃない
$result = Get-Content $old_path -Encoding UTF8 | foreach {
    $a = $_ -split ","
    if ($a.Count -lt 12){
        $additional = (($a.Count + 1)..12 | foreach { "*" }) -join ","
        "$($_),$($additional)"
    } else {
        $_
    }
}

# UTF8-BOMLess LF
$result | %{ $_+"`n" } |
    ForEach-Object{ [Text.Encoding]::UTF8.GetBytes($_) } |
    Set-Content -Encoding Byte -Path $unk_path

# Invoke build command
$lucene_cli = "path to lucene-cli.exe"
$command_str = "$($lucene_cli) analysis kuromoji-build-dictionary UNIDIC $($input_dir) $($output_dir) -e UTF-8 --normalize"

Invoke-Expression $command_str
