# Caminho para o arquivo YAML
$yamlFilePath = "item_randomopt_group.yml"

# Ler o conte�do do arquivo YAML
$yamlContent = Get-Content -Path $yamlFilePath -Raw

# Usar express�o regular para encontrar todas as entradas de MinValue e MaxValue
$pattern = "(MinValue:\s*\d+)\s*(MaxValue:\s*(\d+))"
$yamlContent = [regex]::Replace($yamlContent, $pattern, { param($matches) "$($matches[1])`n$($matches[2])`nMinValue: $($matches[3])" })

# Escrever o conte�do modificado de volta para o arquivo YAML
Set-Content -Path $yamlFilePath -Value $yamlContent

Write-Output "O arquivo YAML foi atualizado com sucesso."
