set datefix=%DATE%
set datefix=%DATE:/=-%


for /f "tokens=3,2,4 delims=-- " %%x in ("%date%") do set d=%%y%%x%%z


set data=%d%

Echo zipping...

del /q C:\ProgramData\Jenkins\.jenkins\workspace\Educaixa\allure-results\*.mp4

"C:\Program Files\7-Zip\7z.exe" a -tzip "C:\Users\rteresa\Desktop\educaixareports%datefix%.zip" "C:\ProgramData\Jenkins\.jenkins\workspace\Educaixa\allure-results"

SwithMail.exe /s /x "C:\ProgramData\Jenkins\.jenkins\workspace\Educaixa\SwithMailSettings.xml" /Attachment "C:\Users\rteresa\Desktop\educaixareports%datefix%.zip"

echo Done!