


//////////////////////////////// MOV 3 ////////////////////////////////

Ndef(\envCtrl, {|att = 8 rel = 8|
	[att, rel]
});
Ndef(\envCtrl).addSpec(\att, [0.02, 8, \lin], \rel, [0.08, 8, \lin]);