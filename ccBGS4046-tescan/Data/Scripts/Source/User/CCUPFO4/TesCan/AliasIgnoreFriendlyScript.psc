Scriptname CCUPFO4:TesCan:AliasIgnoreFriendlyScript extends ReferenceAlias

Event OnLoad()
    Actor myActor = self.getActorRef()
    myActor.IgnoreFriendlyHits(TRUE)
EndEvent