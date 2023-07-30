# ZeroADB
# What is This?
This is the fastest adb/fastboot environment command using Powershell  
Just run the following line and you're done!  
**Administrator privileges are required for execution.**

```pwsh
Start-Process -FilePath "powershell" -ArgumentList "Invoke-Expression (Invoke-WebRequest -Uri 'http://me.katsuyuki-karasawa.dev/ZeroADB/ZeroADB.ps1').Content" -Verb RunAs
```

## Warning!
Currently only Windows is supported.

---
# ZeroADB
# これはなに?
これはPowershellを使用して、最速でadb/fastbootの環境を整えるコマンドです
以下の1行を実行すればすぐに終わります
**管理者権限が必要です**

```pwsh
Start-Process -FilePath "powershell" -ArgumentList "Invoke-Expression (Invoke-WebRequest -Uri 'http://me.katsuyuki-karasawa.dev/ZeroADB/ZeroADB.ps1').Content" -Verb RunAs
```

## 注意
現在はWindowsのみの対応です
