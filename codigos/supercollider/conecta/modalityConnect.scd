// * now in SC, check whether OSC messages arrive:
q.netport = NetAddr.localAddr.port;
q.lilassi.netport = q.netport;
q.vermelhodo.netport = q.netport;
q.laranjare.netport = q.netport;
q.amarelomi.netport = q.netport;
q.verdesol.netport = q.netport;
q.netip = NetAddr.localAddr.ip;
q.lilassi.netip = q.netip;
q.vermelhodo.netip = q.netip;
q.laranjare.netip = q.netip;
q.amarelomi.netip = q.netip;
q.verdefa.netip = q.netIP;
q.verdesol.netip = q.netip;


		// 0.2.wait;

~f = { |msg, time, addr|
	switch (msg[0].value)
	{'/lilassi'} {
		q.lilassi.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.lilassi.netip = addr.ip; q.lilassi.netport = addr.port; "set lilassi netaddr".postln;
	}
	{'/vermelhodo1'} {
		q.vermelhodo.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.vermelhodo.netip = addr.ip; q.vermelhodo.netport = addr.port; "set vermelhodo1 netaddr".postln;
	}
	{'/vermelhodo2'} {
		q.vermelhodo.mktl2.device.updateSrcAddr( addr.ip, addr.port);
		q.vermelhodo.netip = addr.ip; q.vermelhodo.netport = addr.port; "set vermelhodo2 netaddr".postln;
	}
	{'/laranjare'} {
		q.laranjare.mktl.device.updateSrcAddr( addr.ip, addr.port);
		q.laranjare.netip = addr.ip; q.laranjare.netport = addr.port; "set laranjare netaddr ".postln;
	}
	{'/amarelomi'} {
		q.amarelomi.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.amarelomi.netip = addr.ip; q.amarelomi.netport = addr.port; "set amarelomi netaddr ".postln;
	}
	{'/verdefa1'} {
		q.verdefa.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.verdefa.netip = addr.ip; q.verdefa.netport = addr.port; "set verdefa1 netaddr ".postln;
	}
	{'/verdefa2'} {
		q.verdefa.mktl2.device.updateSrcAddr( addr.ip, addr.port );
		q.verdefa.netip = addr.ip; q.verdefa.netport = addr.port; "set verdefa2 netaddr ".postln;
	}
	{'/verdesol'} {
		q.verdesol.mktl.device.updateSrcAddr( addr.ip, addr.port );
		q.verdesol.netip = addr.ip; q.verdesol.netport = addr.port; "set verdesol netaddr".postln;
	};
};
// thisProcess.addOSCRecvFunc(~f);
 /* == q.netport or: q.vermelhodo2.netport == q.netport or: q.laranjare.netport == q.netport or: q.amarelomi.netport == q.netport or: q.verdefa.netport == q.netport*/
Tdef(\setPorts, {
	loop{
		if (
			(q.lilassi.netport == q.netport)  or: (q.vermelhodo.netport == q.netport) or: (q.laranjare.netport == q.netport) or: (q.amarelomi.netport == q.netport)  or: (q.verdefa.netport == q.netport) or: (q.verdesol.netport == q.netport)
		)
		{ fork{ thisProcess.addOSCRecvFunc(~f); 0.025.wait; thisProcess.removeOSCRecvFunc(~f); "setting addrs".postln } }
		{ "all ports are set".postln; Tdef(\setPorts).stop };
		1.wait;
	}
}).play;
{ Tdef(\setPorts).gui.parent.alwaysOnTop_(true) }.defer;
