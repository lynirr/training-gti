$folderPath = Read-Host "Entrez le chemin du dossier à purger"
$daysOld = 7

# Vérifier si le dossier existe
if (Test-Path $folderPath) {
    # Récupérer les fichiers plus anciens que le nombre de jours spécifié
    $files = Get-ChildItem -Path $folderPath -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$daysOld) }
    
    # Supprimer les fichiers trouvés
    foreach ($file in $files) {
        Remove-Item $file.FullName -Force -ErrorAction SilentlyContinue
        Write-Output "Fichier supprimé : $($file.FullName)"
    }
} else {
    Write-Output "Le dossier spécifié n'existe pas."
}
