while($true)
{
  $AllODP = Get-Process -Name "EMR Docproc" 

  ###We run multiple instances of the processor due to high volume.  The files contained in the NextGen_ODP# folder are dependant on your application version###
  #$ProcArray = @("C:\NextGen_ODP01\EMR Docproc.exe","C:\NextGen_ODP02\EMR Docproc.exe","C:\NextGen_ODP03\EMR Docproc.exe","C:\NextGen_ODP04\EMR Docproc.exe","C:\NextGen_ODP05\EMR Docproc.exe")
  $ProcArray = @("C:\NextGen\EMR Docproc.exe")

  foreach($Proc in $ProcArray){
    if(!($AllODP.path -contains $Proc)){
      & $Proc
    }
  }
  Start-Sleep -Seconds 30
}