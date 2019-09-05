Ndef(\saaw, {
	arg cutoff = 1000, rq = 0.25, freq = 100;
	var sig;
	sig = Saw.ar([freq, freq*1.1]);
	sig = RLPF.ar(sig, cutoff.lag(0.2), rq.lag(0.2),0.4);
	sig;
});

Ndef(\saaw).addSpec(\cutoff, [80, 800, \exp, 0, 800]);
Ndef(\saaw).addSpec(\rq, [0.1, 1, \lin, 0, 0.5]);
Ndef(\saaw).addSpec(\freq, [20, 200, \exp, 0, 110]);
Ndef(\saaw).gui;
q.vejasom = Ndef(\saaw).scope;
q.vejasom.size = 600;
q.vejasom.style = 2;
q.vejasom.xZoom = 2;
q.vejasom.yZoom = 2;
Ndef(\saaw).play;