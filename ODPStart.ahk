Loop
{

	WinGet, popuparray, list, ahk_class #32770
	Loop, %popuparray%
	{
		popup := popuparray%A_Index%
		WinClose, ahk_id %popup%
	}
	WinGet, AllWin, List, EMR Document Generator
	Loop, %AllWin%
		{
		WinCode := AllWin%A_Index%
		;Click Start
		ControlClick, WindowsForms10.Window.8.app.0.141b42a_r15_ad111, ahk_id %WinCode%,,,, NA x6 y24
		
		;Get Generated Number
		ControlGetText, GeneratedText, WindowsForms10.STATIC.app.0.141b42a_r15_ad14, ahk_id %WinCode%
		GeneratedArray := StrSplit(GeneratedText, A_Space)
		Generated := % GeneratedArray[2]

		if Generated > 5
			{
			if Generated > 250
				{
				;click stop
				ControlClick, WindowsForms10.Window.8.app.0.141b42a_r15_ad111, ahk_id %WinCode%,,,, NA x6 y48
				;get status
				ControlGetText, StatusText, WindowsForms10.STATIC.app.0.141b42a_r15_ad13, ahk_id %WinCode%
				loop
					{
					if StatusText = Stopped
						{
						break
						}
					Sleep, 1000
					;get status
					ControlGetText, StatusText, WindowsForms10.STATIC.app.0.141b42a_r15_ad13, ahk_id %WinCode%
					}
				WinGet, procpath, ProcessPath, ahk_id %WinCode%
				WinKill, ahk_id %WinCode%
				Sleep, 1000
				Run, %procpath%
				}
			
			;get avg time
			ControlGetText, AvgAllText, WindowsForms10.STATIC.app.0.141b42a_r15_ad112, ahk_id %WinCode%

			AvgArray := StrSplit(AvgAllText, A_Space)
			Avg := % AvgArray[6]
			if Avg >= 25
				{
				;click stop
				ControlClick, WindowsForms10.Window.8.app.0.141b42a_r15_ad111, ahk_id %WinCode%,,,, NA x6 y48
				;get status
				ControlGetText, StatusText, WindowsForms10.STATIC.app.0.141b42a_r15_ad13, ahk_id %WinCode%

				loop
					{
					if StatusText = Stopped
						{
						break
						}
					Sleep, 1000
					ControlGetText, StatusText, WindowsForms10.STATIC.app.0.141b42a_r15_ad13, ahk_id %WinCode%
					}
				WinGet, procpath, ProcessPath, ahk_id %WinCode%
				WinKill, ahk_id %WinCode%
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