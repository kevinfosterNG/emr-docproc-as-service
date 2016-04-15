Loop
{
	WinGet, AllWin, List, EMR Document Generator
	Loop, %AllWin%
		{
		WinCode := AllWin%A_Index%

		ControlClick, WindowsForms10.Window.8.app.0.2bf8098_r13_ad17, ahk_id %WinCode%,,,, NA x6 y24
		
		ControlGetText, GeneratedText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad110, ahk_id %WinCode%
		GeneratedArray := StrSplit(GeneratedText, A_Space)
		Generated := % GeneratedArray[2]

		if Generated > 5
			{
			if Generated > 250
				{
				ControlClick, WindowsForms10.Window.8.app.0.2bf8098_r13_ad17, ahk_id %WinCode%,,,, NA x6 y48
				ControlGetText, StatusText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad19, ahk_id %WinCode%
				loop
					{
					if StatusText = Stopped
						{
						break
						}
					Sleep, 1000
					ControlGetText, StatusText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad19, ahk_id %WinCode%
					}
				WinGet, procpath, ProcessPath, ahk_id %WinCode%
				WinClose, ahk_id %WinCode%
				Sleep, 1000
				Run, %procpath%
				}
			
			ControlGetText, AvgAllText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad15, ahk_id %WinCode%

			AvgArray := StrSplit(AvgAllText, A_Space)
			Avg := % AvgArray[6]
			if Avg >= 25
				{
				ControlClick, WindowsForms10.Window.8.app.0.2bf8098_r13_ad17, ahk_id %WinCode%,,,, NA x6 y48

				ControlGetText, StatusText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad19, ahk_id %WinCode%

				loop
					{
					if StatusText = Stopped
						{
						break
						}
					Sleep, 1000
					ControlGetText, StatusText, WindowsForms10.STATIC.app.0.2bf8098_r13_ad19, ahk_id %WinCode%
					}
				WinGet, procpath, ProcessPath, ahk_id %WinCode%
				WinClose, ahk_id %WinCode%
				Sleep, 1000
				Run, %procpath%
				}
			}
		}


	WinGet, popuparray, list, ahk_class #32770
	Loop, %popuparray%
	{
		popup := popuparray%A_Index%
		WinClose, ahk_id %popup%
	}

Sleep, 10000
}