#SMB3PE

# I smell spaghetti code cooking

[System.Windows.Forms.Application]::EnableVisualStyles()


<# nvm I found the spot where the luigi map palette was
boom boom palette can be changed in discombopulator
he uses the regular enemy palettes
the bottom row of enemy palettes #>

# mario title screen 0x326B-0, Luigi 0x326C1-4
# mario/Luigi overworld, 0x37820,0x37821


$CurrentDir = Get-Location

function FindRom 
{

    #this thing has an eternal hatred for spaces
    $CheckRom = Test-Path -Path "$CurrentDir\Super Mario Bros. 3 (USA).nes"

    
    if ($CheckRom -eq $true) {
    write "rom found"
    BuildGUI
    } 
    
    else {
    write "Rom does not exist! `nPlace `"Super Mario Bros. 3 (USA).nes`" `nin this directory and try again."
    pause
    Write-Output "====================="
    findrom
    }
}






function BuildGUI 
{



    #icon but base64-ified
    $iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAPUExURQAAAD9IzJnZ6v7OxwAAAG0owBoAAAAFdFJOU/////8A+7YOUwAAAAlwSFlzAAAOwwAADsMBx2+oZAAAAIBJREFUOE+VklsKgDAQA330/mfWYXebqgXT+ZAmGXyAW3uwJxlvVgSGI5HiCxphXRhvLlg8oebsB9YEirMTsydwDGrS7ApRv4XhEVEbQikFii8QdQ1cQQpVoLMnoHyl/plAzH0mZO4KEj04wux3yfVmXagTvSdorteLREb5EVq7AO6ECbkOVIgGAAAAAElFTkSuQmCC'
    $iconBytes       = [Convert]::FromBase64String($iconBase64)
    $stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
    $stream.Write($iconBytes, 0, $iconBytes.Length)
    $MARIOW.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())



    Add-Type -assembly System.Windows.Forms

    Add-Type -AssemblyName System.Drawing

    $MMKC = New-Object System.Windows.Forms.label 
    $MMKC.Location = New-Object System.Drawing.Size(105,15)
    $MMKC.Size = New-Object System.Drawing.Size(190,20)
    $MMKC.Text = "Programmed by PheonixMMKC777"



    <#
    $bmp = new-object System.Drawing.Bitmap 250,61 
    $font = new-object System.Drawing.Font Consolas,24 
    $brushBg = [System.Drawing.Brushes]::Yellow 
    $brushFg = [System.Drawing.Brushes]::Black 
    $graphics = [System.Drawing.Graphics]::FromImage($bmp) 
    $graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height)  
    $graphics.Dispose() 
    #>    



    #region Mario




    $MARIOW = New-Object System.Windows.Forms.Form
    $MARIOW.Text ='SMB3 CE'
    $MARIOW.Width = 450
    $MARIOW.Height = 400
    $MARIOW.AutoSize = $true
    $MARIOW.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())



    $ProTip = New-Object System.Windows.Forms.label 
    $ProTip.Location = New-Object System.Drawing.Size(200,40)
    $ProTip.Size = New-Object System.Drawing.Size(138,20)
    $ProTip.Text = "Main         Skin        Outline"


    #Mario Small / Super / Tanooki

    $MARIO_SNT = New-Object System.Windows.Forms.label 
    $MARIO_SNT.Location = New-Object System.Drawing.Size(30,60)
    $MARIO_SNT.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_SNT.Text = "Mario Small/Super/Tanooki"


    $MARIO_SNT1 = New-Object System.Windows.Forms.TextBox
    $MARIO_SNT1.Location = New-Object System.Drawing.Point(200,60)
    $MARIO_SNT1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_SNT2 = New-Object System.Windows.Forms.TextBox
    $MARIO_SNT2.Location = New-Object System.Drawing.Point(250,60)
    $MARIO_SNT2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_SNT3 = New-Object System.Windows.Forms.TextBox
    $MARIO_SNT3.Location = New-Object System.Drawing.Point(300,60)
    $MARIO_SNT3.Size = New-Object System.Drawing.Size(35,20)


    $MARIO_SNTb = New-Object System.Windows.Forms.Button
    $MARIO_SNTb.Location = New-Object System.Drawing.Size(350,60)
    $MARIO_SNTb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_SNTb.Text = "Import"
    $MARIO_SNTb.Add_click({Import_MSNT})



    # M / L Fire Flower

    $MARIO_F = New-Object System.Windows.Forms.label 
    $MARIO_F.Location = New-Object System.Drawing.Size(30,90)
    $MARIO_F.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_F.Text = "Fire, Shares with luigi"


    $MARIO_F1 = New-Object System.Windows.Forms.TextBox
    $MARIO_F1.Location = New-Object System.Drawing.Point(200,90)
    $MARIO_F1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_F2 = New-Object System.Windows.Forms.TextBox
    $MARIO_F2.Location = New-Object System.Drawing.Point(250,90)
    $MARIO_F2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_F3 = New-Object System.Windows.Forms.TextBox
    $MARIO_F3.Location = New-Object System.Drawing.Point(300,90)
    $MARIO_F3.Size = New-Object System.Drawing.Size(35,20)



    $MARIO_Fb = New-Object System.Windows.Forms.Button
    $MARIO_Fb.Location = New-Object System.Drawing.Size(350,90)
    $MARIO_Fb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_Fb.Text = "Import"
    $MARIO_Fb.Add_click({Import_MF})


    # M / L Frog Suit


    $MARIO_Fr = New-Object System.Windows.Forms.label 
    $MARIO_Fr.Location = New-Object System.Drawing.Size(30,120)
    $MARIO_Fr.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_Fr.Text = "Frog, Shares with luigi"


    $MARIO_Fr1 = New-Object System.Windows.Forms.TextBox
    $MARIO_Fr1.Location = New-Object System.Drawing.Point(200,120)
    $MARIO_Fr1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_Fr2 = New-Object System.Windows.Forms.TextBox
    $MARIO_Fr2.Location = New-Object System.Drawing.Point(250,120)
    $MARIO_Fr2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_Fr3 = New-Object System.Windows.Forms.TextBox
    $MARIO_Fr3.Location = New-Object System.Drawing.Point(300,120)
    $MARIO_Fr3.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_Frb = New-Object System.Windows.Forms.Button
    $MARIO_Frb.Location = New-Object System.Drawing.Size(350,120)
    $MARIO_Frb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_Frb.Text = "Import"
    $MARIO_Frb.Add_click({Import_MFr})


    # M / L Hammer

    $MARIO_H = New-Object System.Windows.Forms.label 
    $MARIO_H.Location = New-Object System.Drawing.Size(30,150)
    $MARIO_H.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_H.Text = "Hammer, Shares with luigi"


    $MARIO_H1 = New-Object System.Windows.Forms.TextBox
    $MARIO_H1.Location = New-Object System.Drawing.Point(200,150)
    $MARIO_H1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_H2 = New-Object System.Windows.Forms.TextBox
    $MARIO_H2.Location = New-Object System.Drawing.Point(250,150)
    $MARIO_H2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_H3 = New-Object System.Windows.Forms.TextBox
    $MARIO_H3.Location = New-Object System.Drawing.Point(300,150)
    $MARIO_H3.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_Hb = New-Object System.Windows.Forms.Button
    $MARIO_Hb.Location = New-Object System.Drawing.Size(350,150)
    $MARIO_Hb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_Hb.Text = "Import"
    $MARIO_Hb.Add_click({Import_MH})


    # M / L Kitsune

    $MARIO_K = New-Object System.Windows.Forms.label 
    $MARIO_K.Location = New-Object System.Drawing.Size(30,180)
    $MARIO_K.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_K.Text = "Kitsune, Shares with luigi"

    $MARIO_K1 = New-Object System.Windows.Forms.TextBox
    $MARIO_K1.Location = New-Object System.Drawing.Point(200,180)
    $MARIO_K1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_K2 = New-Object System.Windows.Forms.TextBox
    $MARIO_K2.Location = New-Object System.Drawing.Point(250,180)
    $MARIO_K2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_K3 = New-Object System.Windows.Forms.TextBox
    $MARIO_K3.Location = New-Object System.Drawing.Point(300,180)
    $MARIO_K3.Size = New-Object System.Drawing.Size(35,20)


    $MARIO_Kb = New-Object System.Windows.Forms.Button
    $MARIO_Kb.Location = New-Object System.Drawing.Size(350,180)
    $MARIO_Kb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_Kb.Text = "Import"
    $MARIO_Kb.Add_click({Import_MK})


    # M / L Statue

    $MARIO_St = New-Object System.Windows.Forms.label 
    $MARIO_St.Location = New-Object System.Drawing.Size(30,210)
    $MARIO_St.Size = New-Object System.Drawing.Size(150,20)
    $MARIO_St.Text = "Statue, Shares with luigi"


    $MARIO_St1 = New-Object System.Windows.Forms.TextBox
    $MARIO_St1.Location = New-Object System.Drawing.Point(200,210)
    $MARIO_St1.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_St2 = New-Object System.Windows.Forms.TextBox
    $MARIO_St2.Location = New-Object System.Drawing.Point(250,210)
    $MARIO_St2.Size = New-Object System.Drawing.Size(35,20)

    $MARIO_St3 = New-Object System.Windows.Forms.TextBox
    $MARIO_St3.Location = New-Object System.Drawing.Point(300,210)
    $MARIO_St3.Size = New-Object System.Drawing.Size(35,20)


    $MARIO_Stb = New-Object System.Windows.Forms.Button
    $MARIO_Stb.Location = New-Object System.Drawing.Size(350,210)
    $MARIO_Stb.Size = New-Object System.Drawing.Size(50,20)
    $MARIO_Stb.Text = "Import"
    $MARIO_Stb.Add_click({Import_MSt})


    # Mr Green


    $Luigi_SMT = New-Object System.Windows.Forms.label 
    $Luigi_SMT.Location = New-Object System.Drawing.Size(30,240)
    $Luigi_SMT.Size = New-Object System.Drawing.Size(150,20)
    $Luigi_SMT.Text ="Luigi Small/Super/Tanooki"

    $Luigi_SMT1 = New-Object System.Windows.Forms.TextBox
    $Luigi_SMT1.Location = New-Object System.Drawing.Point(200,240)
    $Luigi_SMT1.Size = New-Object System.Drawing.Size(35,20)

    $Luigi_SMT2 = New-Object System.Windows.Forms.TextBox
    $Luigi_SMT2.Location = New-Object System.Drawing.Point(250,240)
    $Luigi_SMT2.Size = New-Object System.Drawing.Size(35,20)

    $Luigi_SMT3 = New-Object System.Windows.Forms.TextBox
    $Luigi_SMT3.Location = New-Object System.Drawing.Point(300,240)
    $Luigi_SMT3.Size = New-Object System.Drawing.Size(35,20)


    $Luigi_SMTb = New-Object System.Windows.Forms.Button
    $Luigi_SMTb.Location = New-Object System.Drawing.Size(350,240)
    $Luigi_SMTb.Size = New-Object System.Drawing.Size(50,20)
    $Luigi_SMTb.Text = "Import"
    $Luigi_SMTb.Add_click({Import_LSMT})



    #Savtool

    $palimg = (get-item "$CurrentDir/savtool.png")
    $palimg = [System.Drawing.Image]::Fromfile($palimg)

    $savtool = new-object Windows.Forms.PictureBox
    $savtool.Image = $palimg
    $savtool.SizeMode = "Autosize"
    $savtool.location = New-Object System.Drawing.Point(25,280)


    #endregion









    #watch these


    $MARIOW.Controls.Add($MARIO_SNT)
    $MARIOW.Controls.Add($MARIO_SNT1)
    $MARIOW.Controls.Add($MARIO_SNT2)
    $MARIOW.Controls.Add($MARIO_SNT3)
    $MARIOW.Controls.Add($MARIO_SNTb)

    $MARIOW.Controls.Add($MARIO_F)
    $MARIOW.Controls.Add($MARIO_F1)
    $MARIOW.Controls.Add($MARIO_F2)
    $MARIOW.Controls.Add($MARIO_F3)
    $MARIOW.Controls.Add($MARIO_Fb)


    $MARIOW.Controls.Add($MARIO_Fr)
    $MARIOW.Controls.Add($MARIO_Fr1)
    $MARIOW.Controls.Add($MARIO_Fr2)
    $MARIOW.Controls.Add($MARIO_Fr3)
    $MARIOW.Controls.Add($MARIO_Frb)



    $MARIOW.Controls.Add($MARIO_H)
    $MARIOW.Controls.Add($MARIO_H1)
    $MARIOW.Controls.Add($MARIO_H2)
    $MARIOW.Controls.Add($MARIO_H3)
    $MARIOW.Controls.Add($MARIO_Hb)



    $MARIOW.Controls.Add($MARIO_K)
    $MARIOW.Controls.Add($MARIO_K1)
    $MARIOW.Controls.Add($MARIO_K2)
    $MARIOW.Controls.Add($MARIO_K3)
    $MARIOW.Controls.Add($MARIO_Kb)    



    $MARIOW.Controls.Add($MARIO_St)
    $MARIOW.Controls.Add($MARIO_St1)
    $MARIOW.Controls.Add($MARIO_St2)
    $MARIOW.Controls.Add($MARIO_St3)
    $MARIOW.Controls.Add($MARIO_Stb)


    $MARIOW.Controls.Add($LUIGI_SMT)
    $MARIOW.Controls.Add($LUIGI_SMT1)
    $MARIOW.Controls.Add($LUIGI_SMT2)
    $MARIOW.Controls.Add($LUIGI_SMT3)
    $MARIOW.Controls.Add($LUIGI_SMTb)


    $MARIOW.Controls.Add($MMKC)
    $MARIOW.Controls.Add($ProTip)
    $MARIOW.Controls.Add($savtool)

    #Keep at bottom
    $MARIOW.ShowDialog()

}


#region importfunctions


function Import_MSNT
{

    
    $MainC = $MARIO_SNT1.Text
    $SkinC = $MARIO_SNT2.Text
    $OutlineC = $MARIO_SNT3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x01053A

            # Main
    $bytes[$offset]   = $MC

            # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC


    
    #mario TitleScreen
    $offset = 0x0326BE 

            # Main
    $bytes[$offset]   = $MC

            # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC






[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}




function Import_MF
{

    
    $MainC = $MARIO_F1.Text
    $SkinC = $MARIO_F2.Text
    $OutlineC = $MARIO_F3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x010542

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC


    #change offset for overworld after level
    $offset = 0x037834

    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC



    #change offset for overworld outta item
    $offset = 0x034587

    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC






[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}










function Import_MFr
{

    
    $MainC = $MARIO_Fr1.Text
    $SkinC = $MARIO_Fr2.Text
    $OutlineC = $MARIO_Fr3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x01054A

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC

[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}


function Import_MK
{

    
    $MainC = $MARIO_K1.Text
    $SkinC = $MARIO_K2.Text
    $OutlineC = $MARIO_K3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x01054E

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC

[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}



function Import_MH
{

    
    $MainC = $MARIO_H1.Text
    $SkinC = $MARIO_H2.Text
    $OutlineC = $MARIO_H3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x010552

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC

[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}


function Import_MSt
{

    
    $MainC = $MARIO_St1.Text
    $SkinC = $MARIO_St2.Text
    $OutlineC = $MARIO_St3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x010556

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC

[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}



function Import_LSMT
{

    
    $MainC = $LUIGI_SMT1.Text
    $SkinC = $LUIGI_SMT2.Text
    $OutlineC = $LUIGI_SMT3.Text

    $MC = [convert]::toint32($MainC,16) 
    $SC = [convert]::toint32($SkinC,16) 
    $OC = [convert]::toint32($OutlineC,16) 


    $bytes  = [System.IO.File]::ReadAllBytes("$CurrentDir\Super Mario Bros. 3 (USA).nes")
    $offset = 0x01053E

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC


    $offset = 0x0326C2

           # Main
    $bytes[$offset]   = $MC

           # Skin
    $bytes[$offset+1] = $SC

           # Outline
    $bytes[$offset+2] = $OC




[System.IO.File]::WriteAllbytes("$CurrentDir\Super Mario Bros. 3 (USA).nes", $bytes)

}


#endregion importfunctions





findrom



