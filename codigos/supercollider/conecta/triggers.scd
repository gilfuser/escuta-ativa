	Ndef(\trigs_mov1, {
		var lilassit, vermelhodot, laranjaret, amarelomit, verdefat, verdesolt;
		vermelhodot = ( InRange.kr( \tvermelhodo.kr(0.5), \domin.kr(0.48), \domax.kr(0.9) ) - 1 * (-1) ).abs;
		laranjaret = ( InRange.kr( \tlaranjare.kr(0.5), \remin.kr(0.48), \remax.kr(0.9) ) - 1 * (-1) ).abs;
		amarelomit = ( InRange.kr( \tamarelomi.kr(0.5), \mimin.kr(0.4), \mimax.kr(0.8) ) - 1 * (-1) ).abs;
		verdefat  = ( InRange.kr( \tverdefa.kr(0.5), \famin.kr(0.4), \famax.kr(0.8) ) - 1 * (-1) ).abs;
		verdesolt = ( InRange.kr( \tverdesol.kr(0.5), \solmin.kr(0.33), \solmax.kr(0.9) ) - 1 * (-1) ).abs;
		lilassit = ( InRange.kr( \tlilassi.kr(0.5, 0), \simin.kr(0.4), \simax.kr(0.8) ) - 1 * (-1) ).abs;
		SendReply.kr( Trig1.kr(lilassit), '/lilassi_mov1', lilassit );
		SendReply.kr( Trig1.kr(vermelhodot), '/vermelhodo_mov1', vermelhodot );
		SendReply.kr( Trig1.kr(laranjaret), '/laranjare_mov1', laranjaret );
		SendReply.kr( Trig1.kr(amarelomit), '/amarelomi_mov1', amarelomit );
		SendReply.kr( Trig1.kr(verdefat), '/verdefa_mov1', verdefat );
		SendReply.kr( Trig1.kr(verdesolt), '/verdesol_mov1', verdesolt );
		[ lilassit, vermelhodot, laranjaret, amarelomit, verdefat, verdesolt ]
	});

	{ Ndef(\trigs_mov1).gui(19) }.defer;

	Ndef(\trigs_mov1).addSpec(
		\tvermelhodo, [0,1], \domin, [ 0, 0.5 ], \domax, [0.5, 1],
		\tlaranjare, [0,1], \remin, [ 0, 0.5 ], \remax, [0.5, 1],
		\tamarelomi, [0,1], \mimin, [ 0, 0.5 ], \mimax, [0.5, 1],
		\tverdefa, [0,1], \famin, [ 0, 0.5 ], \famax, [0.5, 1],
		\tverdesol, [0,1], \solmin,[ 0, 0.5 ], \solmax,[0.5, 1],
		\tlilassi, [0,1], \simin, [ 0, 0.5 ], \simax, [0.5, 1],
	);

// -------------------------------------------------------------------------------------------------------------

// MOV 2

	Ndef(\trigs_mov2, { //| degsi degdo degre degmi degfa|
		SendReply.kr( Changed.kr( \degdo.kr(0) ), '/vermelhodo_mov2', [ \degdo.kr(0), \attdo.kr(0), \reldo.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degre.kr(0) ), '/laranjare_mov2', [ \degre.kr(0), \attre.kr(0), \relre.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degmi.kr(0) ), '/amarelomi_mov2', [ \degmi.kr(0), \attmi.kr(0), \relmi.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degfa.kr(0) ), '/verdefa_mov2', [ \degfa.kr(0), \attfa.kr(0), \relfa.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsol.kr(0) ), '/verdesol_mov2', [ \degsol.kr(0), \attsol.kr(0), \relsol.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsi.kr(0) ), '/lilassi_mov2', [ \degsi.kr(0), \attsi.kr(0), \relsi.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\trigs_mov2).addSpec(
		\degsi, [ 0, 7, \lin, 1 ], \attsi, [0.02, 2], \relsi, [0.2, 2],
		\degdo, [ -12, -4, \lin, 1 ], \attdo, [0.02, 2], \reldo, [0.2, 2],
		\degre, [ -7, 0, \lin, 1 ], \attre, [0.02, 2], \relre, [0.2, 2],
		\degmi, [ 0, 7, \lin, 1 ], \attmi, [0.02, 2], \relmi, [0.2, 2],
		\degfa, [ 0, 7, \lin, 1 ], \attfa, [0.02, 2], \relfa, [0.2, 2],
		\degsol, [ 0, 7, \lin, 1 ], \attsol, [0.02, 2], \relsol, [0.2, 2]
	);

	{ Ndef(\trigs_mov2).gui(19) }.defer;

// -------------------------------------------------------------------------------------------------------------------

// MOV 3

	Ndef(\trigs_mov3, {
		SendReply.kr( Changed.kr( \degdo.kr(0) ), '/vermelhodo_mov3', [ \degdo.kr(0), \attdo.kr(0), \reldo.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degre.kr(0) ), '/laranjare_mov3', [ \degre.kr(0), \attre.kr(0), \relre.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degmi.kr(0) ), '/amarelomi_mov3', [ \degmi.kr(0), \attmi.kr(0), \relmi.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degfa.kr(0) ), '/verdefa_mov3', [ \degfa.kr(0), \attfa.kr(0), \relfa.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsol.kr(0) ), '/verdesol_mov3', [ \degsol.kr(0), \attsol.kr(0), \relsol.kr(0.25) ] );
		SendReply.kr( Changed.kr( \degsi.kr(0) ), '/lilassi_mov3', [ \degsi.kr(0), \attsi.kr(0), \relsi.kr(0.25) ] );
		DC.kr(0);
	});

	Ndef(\trigs_mov3).addSpec(
		\degsi, [ 0, 7, \lin,1], \attsi, [0.02, 2], \relsi, [0.2, 2],
		\degdo, [-12,-4,\lin,1], \attdo, [0.02, 2], \reldo, [0.2, 2],
		\degre, [-7,0,\lin,1], \attre, [0.02, 2], \relre, [0.2, 2],
		\degmi, [ 0, 7, \lin,1], \attmi, [0.02, 2], \relmi, [0.2, 2],
		\degfa, [ 0, 7, \lin,1], \attfa, [0.02, 2], \relfa, [0.2, 2],
		\degsol, [ 0, 7, \lin,1], \attsol, [0.02, 2], \relsol, [0.2, 2]
	);

	{ Ndef(\trigs_mov3).gui(19) }.defer;