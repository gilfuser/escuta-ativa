// ponha o cursor em qualquer lugar entre os parêntesis e aperte Ctrl + enter
// se o SuperCollider reiniciar repita a operacao
(
q = q ? ();
q.lilassi = q.lilassi ? ();
q.vermelhodo = q.vermelhodo ? ();
q.laranjare = q.laranjare ? ();
q.amarelomi = q.amarelomi ? ();
q.verdefa = q.verdefa ? ();
q.verdesol = q.verdesol ? ();
q.scale = Scale.at(\lydianMinor);

// "teste-quark*".loadRelative;

q.numChans = 2;
s.waitForBoot({
	q.postServerOptions;
	q.pxmix = NdefMixer(s, 12);
	q.pxmix.skipjack.dt = 0.05;
	q.pxmix.moveTo(5, 5);
	ProxyMeter.addMixer(q.pxmix);
	s.scope(q.numChans).window.bounds_(Rect(700, 5, 261, 250));
});
p = Ndef.dictFor(s); // p.push;
// put this into globals .. or use in the interfaces used!
q.active = q.active ?? {()};
q.isActive = { |q, obj| q.active.any(_.includes(obj)) };
);
(
///////////    SOUNDS	  ///////////////////////
// load some sound processes - put your own here
"processes/melodiaSol*".loadRelative;
"processes/dubba*".loadRelative;
"processes/skmecsynth*".loadRelative;
"processes/isaks_jetSet*".loadRelative;
// or let sc choose some for you:
/*
"2_processes*.scd".resolveRelative.pathMatch.scramble.keep(4)
.postcs.do(_.loadRelative);
*/
// get the loaded Ndefs by name
// - change here to also get Tdefs, Pdefs
// tell them to play, but keep amp at 0
// q.ndefs = q.ndefs.reject({ |ndef| ndef.key==\dummy}); // clean up our dummy
if( Ndef.dictFor(s).arProxyNames.includes(\dummy)){Ndef(\dummy).clear;};
q.ndefs = q.getNdefs;
q.ndefs.do {|ndef| ndef.set(\amp, 0).fadeTime_(1).play };
);

// TODO: Improve MFdefs, pitch FX + q.scale-degreeToRatio

s.waitForBoot({
	/************** OSC OUT ********************/
	q.net = NetAddr( /*"127.0.0.1"*/ "192.168.0.2", 12000); // IP e Port do Processing
	0.2.wait;
	/*
	q.net.disconnect;
	q.net.connect;
	*/
	"globals/0_loadGlobalUtils.scd".loadRelative;
	0.2.wait;
	"todos_os_tubos_ndefs*".loadRelative;
	0.2.wait;
	"_SoundLib*".loadRelative;
	0.2.wait;
	"_SampleLib*".loadRelative;
	0.2.wait;
	"sons/tunel*".loadRelative;
	0.2.wait;
	"sons/acid*".loadRelative;
	0.2.wait;
	"conecta/listeners*".loadRelative;
	0.2.wait;
	"conecta/triggers*".loadRelative;
	0.2.wait;
	"fx/fxLib*".loadRelative;
	0.4.wait;
	// "Sons/terra*".loadRelative;
	// (q.topDir +/+ "FX/FXXX_tubos.scd").openDocument;
	"fx/add_pxChains*".loadRelative;
	0.2.wait;
	"conecta/modalityInit*".loadRelative;
	// (q.topDir +/+ "modalityInit.scd").openDocument;
	0.2.wait;
	"conecta/modalityConnect*".loadRelative;
	(q.topDir +/+ "conecta/modalityConnect.scd").openDocument;
	0.4.wait;
	"conecta/modality_do_stuff*".loadRelative;
	0.2.wait;
	// (q.topDir +/+ "conecta/modality_do_stuff.scd").openDocument;
	// 0.2.wait;
	// (q.topDir +/+ "dataPlay/8_dataPlay.scd").openDocument;
	"fx/masterFX*".loadRelative;
	0.2.wait;
	(q.topDir +/+ "controle.scd").openDocument;
	/*
	"grava-movimento*".loadRelative;
	*/
	0.2.wait;
	(\amp: 0.5).play;
	// make a window and embed a ServerMeterView inside of it.
	q.m = Window.new("Server Levels", Rect(1750, 750, 140, 240));
	ServerMeterView.new(s, q.m, 0@0, 2, 2);
	q.m.front; // show the window
	q.m.alwaysOnTop_(true)
});
)

/*
MFdef(\imu).disable(\post)  // Shift + Enter nesta linha para parar de mostrar os números do acelerômetro
MFdef(\imu).enable(\post)  // Shift + Enter nesta linha para mostrar os números do acelerômetro

~bpm = 240;
(
p = ProxySpace.push(s,p);
m = ProxyMixer(p, 8);
m.skipjack.dt = 0.05;
m.moveTo(5, 5);
ProxyMeter.addMixer(m);
p.do(_.play(0));
)
~kaos = 0.1;  // for strum
~bpm = {| bpm = 120 | bpm};
~bpm.addSpec(\bpm, [3.6, 360, \lin, 0.1, 60]).lag(0);
~bpm.fadeTime_(1);  // why this is "not understood"?
~div = 4;
//~ampL = 0.5;        // for bubble's amp
//~dist = 0.1;
a = Scale.choose(7, 12).tuning_(Tuning.choose(12));
p.makeTempoClock(~bpm.source/60); p.quant = (/*~bpm.source / 60 **/4);
*/