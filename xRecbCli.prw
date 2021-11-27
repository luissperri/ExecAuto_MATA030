#Include 'Protheus.ch'
#include 'Totvs.ch'
 
User Function xRecbCli(aDados)
	Local i := 0
	Private xAutoCad 	:= {}
	Private lMsErroAuto := .F.

For i := 1 to Len(aDados)
		// Monta Array para Execução.
		xAutoCad := {}
		Aadd(xAutoCad,{"A1_FILIAL" 	,aDados[i,1],  Nil})
		Aadd(xAutoCad,{"A1_COD"	 	,aDados[i,2],  Nil})
		Aadd(xAutoCad,{"A1_LOJA"	,aDados[i,3],  Nil})
		Aadd(xAutoCad,{"A1_PESSOA" 	,aDados[i,4],  Nil})
		Aadd(xAutoCad,{"A1_TIPO" 	,aDados[i,5],  Nil})
		Aadd(xAutoCad,{"A1_NOME"	,aDados[i,6],  Nil})
		Aadd(xAutoCad,{"A1_NREDUZ" 	,aDados[i,7],  Nil})
		Aadd(xAutoCad,{"A1_END"	 	,aDados[i,8],  Nil})
		Aadd(xAutoCad,{"A1_EST"	 	,aDados[i,9],  Nil})
		Aadd(xAutoCad,{"A1_MUN"		,aDados[i,10], Nil})
		Aadd(xAutoCad,{"A1_COD_MUN"	,aDados[i,11], Nil})
		Aadd(xAutoCad,{"A1_BAIRRO" 	,aDados[i,12], Nil})
		Aadd(xAutoCad,{"A1_CGC" 	,aDados[i,13], Nil})
Begin Transaction
		MsExecAuto({|x,y| MATA030(x,y)}, xAutoCad, 3)
		If lMsErroAuto
			DisarmTransaction()
			MostraErro()
		EndIf
End Transaction
	next 
		MsgInfo("Processo finalizado")
return

