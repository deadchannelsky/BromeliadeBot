;generate and return random GUID

rand_guid()
{
ComObject := ComObjCreate("Scriptlet.TypeLib")
NewGUID := ComObject.Guid

StringTrimLeft, GUID, NewGUID,1
StringTrimRight, GUID, GUID,3	
	
	return %GUID%
	
}

