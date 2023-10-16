Scriptname CCUPFO4:TesCan:Version100Script extends Quest
{Updates 1.0.0}

Group Required_Properties
	CCUPFO4:TesCan:VersionTrackingQuestScript Property Track Auto Const Mandatory
EndGroup

Group BestOfThree_Fixes
	Quest Property ccBGSFO4046_BestOfThree Auto Const
	Perk Property ccBGSFO4046_GunnerPipboyPerk Auto Const
EndGroup


Group Virgil_Aggro_Fix
	ReferenceAlias Property Virgil Auto Const
	Quest Property DN053 Auto Const
EndGroup


Function Process()

	;bug # 000000 - Magic cloak effect knocks Virgil out of his friendly Faction
	bool DN053StartStageDone = DN053.IsStageDone(10) ; starting stage that will begin when player enters Virgil's dungeon
	bool CCPipboyInspectStage = ccBGSFO4046_BestOfThree.IsStageDone(6) ; stage that directs player to pick up gunner's pipboy

	if ( CCPipboyInspectStage || DN053StartStageDone )
			Virgil.GetReference().IgnoreFriendlyHits(true)
	endif
	
	;bug # 000001 - Gunner Pipboy Perk does not remove from player upon quest completion
	if ( ccBGSFO4046_BestOfThree.IsCompleted() )
		if Game.GetPlayer().HasPerk(ccBGSFO4046_GunnerPipboyPerk)
			Game.GetPlayer().RemovePerk(ccBGSFO4046_GunnerPipboyPerk)
		endif
	endif
	
	debug.trace(self + " CCUPFO4 1.0.0 Updates Done.")
	Track.iVersion = 100
	Stop()
EndFunction