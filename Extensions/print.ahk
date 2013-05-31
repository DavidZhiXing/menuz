Print()
{
	Select := ReturnTypeString(SaveString)
	If RegExMatch(Select.Type,"(^\.)|(^Folder$)|(^Drive$)|(^NoExt$)")
	{
		ThisFile := "Print """ Select.string """"
		Run %ThisFile%,,UseErrorLevel
		If ErrorLevel
			Msgbox % �ļ��������ĳ�������Ч�Ĵ�ӡ����
		Return
	}
	If RegExMatch(Select.Type,"^Multifiles$")
	{
		FilesString := Select.String
		Loop,Parse,FilesString,`n,`r
		{
			Files := ReturnTypeString(A_LoopField)
			If RegExMatch(Files.Type,"^\.")
			{
				If Strlen(Files.String) > 0
				{ 
					ThisFile := "Print """ Files.string """"
					Msgbox % ThisFile
					Run %ThisFile%,,UseErrorLevel
					If ErrorLevel
						Msgbox % �ļ��������ĳ�������Ч�Ĵ�ӡ����
				}
			}
		}
	}
}
