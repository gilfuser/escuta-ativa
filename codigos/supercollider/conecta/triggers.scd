	Ndef(\trigs_mov1, { | min = 0.33, max = 0.9 |
		var lilassit, vermelhodo1t, vermelhodo2t, laranjaret, amarelomit, verdefa1t, verdefa2t, verdesolt;
		lilassit = ( InRange.kr( \tlilassi.kr(0.5, 0), min, max ) - 1 * (-1) ).abs;
		vermelhodo1t = ( InRange.kr( \tvermelhodo1.kr(0.5), min, max ) - 1 * (-1) ).abs;
		vermelhodo2t = ( InRange.kr( \tvermelhodo2.kr(0.5), min, max ) - 1 * (-1) ).abs;
		laranjaret = ( InRange.kr( \tlaranjare.kr(0.5), min, max ) - 1 * (-1) ).abs;
		amarelomit = ( InRange.kr( \tamarelomi.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdefa1t  = ( InRange.kr( \tverdefa1.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdefa2t  = ( InRange.kr( \tverdefa2.kr(0.5), min, max ) - 1 * (-1) ).abs;
		verdesolt = ( InRange.kr( \tverdesol.kr(0.5), min, max ) - 1 * (-1) ).abs;
		SendReply.kr( Trig1.kr(lilassit), '/lilassi_reply', lilassit );
		SendReply.kr( Trig1.kr(vermelhodo1t), '/vermelhodo1_reply', vermelhodo1t );
		SendReply.kr( Trig1.kr(vermelhodo2t), '/vermelhodo2_reply', vermelhodo2t );
		SendReply.kr( Trig1.kr(laranjaret), '/laranjare_reply', laranjaret );
		SendReply.kr( Trig1.kr(amarelomit), '/amarelomi_reply', amarelomit );
		SendReply.kr( Trig1.kr(verdefa1t), '/verdefa1_reply', verdefa1t );
		SendReply.kr( Trig1.kr(verdefa2t), '/verdefa2_reply', verdefa2t );
		SendReply.kr( Trig1.kr(verdesolt), '/verdesol_reply', verdesolt );
		[ lilassit, vermelhodo1t, vermelhodo2t, laranjaret, amarelomit, verdefa1t, verdefa2t, verdesolt ]
	});

	Ndef(\trigs_mov1).gui(10);
	// Ndef(\triggers).scope;
	// Ndef(\triggers2).clear;

	Ndef(\trigs_movs2_3, { //| degsi degdo1 degre degmi degfa1|
		SendReply.kr( Changed.kr( \degdo1.kr(0) ), '/vermelhodo1_reply', [ \degdo1.kr(0), \attdo1.kr(0), \reldo1.kr(0.25) ] );
		// SendReply.kr( Changed.kr( \degdo2.kr(0) ), '/vermelhodo2_reply', [ \degdo2.kr(0), \attdo2.kr(0), \reldo2.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degre.kr(0) ), '/laranjare_reply', [ \degre.kr(0), \attre.kr(0), \relre.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degmi.kr(0) ), '/amarelomi_reply', [ \degmi.kr(0), \attmi.kr(0), \relmi.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degfa1.kr(0) ), '/verdefa1_reply', [ \degfa1.kr(0), \attfa1.kr(0), \relfa1.kr(0.25) ] );
		// SendReply.kr( Changed.kr( \degfa2.kr(0) ), '/verdefa1_reply', [ \degfa2.kr(0), \attfa2.kr(0), \relfa2.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsol.kr(0) ), '/verdesol_reply', [ \degsol.kr(0), \attsol.kr(0), \relsol.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsi.kr(0) ), '/lilassi_reply', [ \degsi.kr(0), \attsi.kr(0), \relsi.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\trigs_movs2_3).addSpec(
		\degsi, [0,7,\lin,1], \attsi, [0.02, 2], \relsi, [0.2, 2],
		\degdo1, [-12,-4,\lin,1], \attdo1, [0.02, 2], \reldo1, [0.2, 2],
		\degdo2, [-12,-4,\lin,1], \attdo2, [0.02, 2], \reldo2, [0.2, 2],
		\degre, [-7,0,\lin,1], \attre, [0.02, 2], \relre, [0.2, 2],
		\degmi, [0,7,\lin,1], \attmi, [0.02, 2], \relmi, [0.2, 2],
		\degfa1, [0,7,\lin,1], \attfa1, [0.02, 2], \relfa1, [0.2, 2],
		\degfa2, [0,7,\lin,1], \attfa2, [0.02, 2], \relfa2, [0.2, 2],
		\degsol, [0,7,\lin,1], \attsol, [0.02, 2], \relsol, [0.2, 2]
	);

	{ Ndef(\trigs_movs2_3).gui(20) }.defer;