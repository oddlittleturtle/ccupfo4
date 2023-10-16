Scriptname CCUPFO4:TesCan:VersionTrackingQuestScript extends Quest
{Creation Club Tesla Cannon Version Tracking script. For maintaining CCUPFO4 progressive updates.}

int Property iVersion Auto Hidden
Actor Player

Group maintainance
	CCUPFO4:TesCan:Version100Script Property Version100 Auto Const
EndGroup

Event OnInit()
	;assumes nothing has been run
	iVersion = 0
	
	Player = Game.GetPlayer()
	RegisterForRemoteEvent(Player, "OnPlayerLoadGame")
	
	Process()
EndEvent


Event Actor.OnPlayerLoadGame(Actor akSender)
	Process()
EndEvent


Function Process()
	debug.trace(self + " CCUPFO4 update check running. ")
	
	;cycles through updates.
	if (iVersion < 100)
		debug.trace(self + " CCUPFO4 version tracking 1.0.0")
		;Version100.Process()
	endif
	
	debug.trace(self + " CCUPFO4 update check done.")
EndFunction
