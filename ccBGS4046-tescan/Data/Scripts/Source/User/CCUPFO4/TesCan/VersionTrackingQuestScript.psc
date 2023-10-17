Scriptname CCUPFO4:TesCan:VersionTrackingQuestScript extends Quest
{Creation Club Tesla Cannon Version Tracking script. For maintaining CCUPFO4 progressive updates.}

Actor Player ; the player

Group Versions
	float Property fVersion Auto Hidden
	{needed so the other scripts can access it}

	CCUPFO4:TesCan:Version100Script Property Version100 Auto Const
	{Version 1.0.0}
EndGroup

Event OnInit()
	;assumes nothing has been run
	fVersion = 0.0
	
	;for save integrity and middle of game updating
	Player = Game.GetPlayer()
	RegisterForRemoteEvent(Player, "OnPlayerLoadGame")
	
	Process()
EndEvent


Event Actor.OnPlayerLoadGame(Actor akSender)
	;assumes nothing has been run
	fVersion = 0.0
	
	Process()
EndEvent


Function Process()
	debug.trace(self + " CCUPFO4 update check running. ")
	
	;cycles through updates.
	if (fVersion < 1.00)
		debug.trace(self + " CCUPFO4 version tracking " + fVersion)
		Version100.Process()
	endif
	
	debug.trace(self + " CCUPFO4 update check done.")
EndFunction
