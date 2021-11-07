// File: ListNodeObject.agc
// Created: 21-11-07

Type ListNode
	nextNode
	element
EndType

Function ConstructListNode(element)
	newNode As ListNode
	newNode.nextNode = 0
	newNode.element = element
EndFunction newNode

Function CreateNext(node As ListNode, element)
	newNext As ListNode
	newNext = ConstructListNode(element)
	SetNext(node, newNext)
EndFunction

Function SetNext(thisNode As ListNode, nextNode As ListNode)
//~	temp As ListNode
//~	temp = thisNode.nextNode
//~	thisNode.nextNode = nextNode
//~EndFunction temp
EndFunction

Function GetNext(node As ListNode)
EndFunction node.nextNode