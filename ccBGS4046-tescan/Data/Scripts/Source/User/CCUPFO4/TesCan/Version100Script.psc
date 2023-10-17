Scriptname CCUPFO4:TesCan:Version100Script extends Quest
{Updates 1.0.0}

Group Required_Properties
	CCUPFO4:TesCan:VersionTrackingQuestScript Property Track Auto Const Mandatory
EndGroup

Group BestOfThree_Fixes
	Quest Property ccBGSFO4046_BestOfThree Auto Const
	{autofill}
	Perk Property ccBGSFO4046_GunnerPipboyPerk Auto Const
	{autofill}
EndGroup


Group Virgil_Aggro_Fix
	ReferenceAlias Property Virgil Auto Const
	{autofill}
	Quest Property DN053 Auto Const
	{autofill}
	Faction Property DN053_VirgilFaction Auto Const
	{autofill}
	Location Property VirgilsLabLocation Auto Const
	{autofill}
EndGroup


Function Process()
	Actor Player = Game.GetPlayer()

	;issue # 1 - Magic cloak effect knocks Virgil out of his friendly Faction
	bool DN053SuicideStageDone = DN053.IsStageDone(40) ; Virgil's suicide stage
	bool CCPipboyInspectStage = ccBGSFO4046_BestOfThree.IsStageDone(6) ; stage that directs player to pick up gunner's pipboy

	if (Player.IsInLocation(VirgilsLabLocation) && !DN053SuicideStageDone)
		if (CCPipboyInspectStage)
			;make sure he's in his faction
			Virgil.GetActorReference().AddToFaction(DN053_VirgilFaction)
			
			;calm him down if necessary
			Virgil.GetActorReference().StopCombatAlarm()
			
			;remind him that you're allowed to hit him
			Virgil.GetReference().IgnoreFriendlyHits(true)
		endif
	endif

	;issue # 2 - Gunner Pipboy Perk does not remove from player upon quest completion
	if (ccBGSFO4046_BestOfThree.IsCompleted())
		if Player.HasPerk(ccBGSFO4046_GunnerPipboyPerk)
			Player.RemovePerk(ccBGSFO4046_GunnerPipboyPerk)
		endif
	endif
	
	Track.fVersion = 1.00
	debug.trace(self + " CCUPFO4 " + Track.fVersion + " Updates Done.")
	Stop()
EndFunction