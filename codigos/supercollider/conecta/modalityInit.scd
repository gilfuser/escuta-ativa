/*
// if you need to open a port manually
// thisProcess.openUDPPort(12345);
// test stuff locally
n = NetAddr.localAddr;
n.port
g.device.updateSrcAddr(n.hostname, n.port);
n.sendMsg('/lilassi', *[0, 0, 0, -16000, 0, 16000 ]);
*/

	// q.lilassi.mktl.clear;
q.lilassi.mktl = MKtl(\lilassi, "skmecs-tubo*", multiIndex: 0);
{ q.lilassi.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// update with the address seen in OSCMon or OSCFunc.trace:
	// q.lilassi.mktl.device.updateSrcAddr("192.168.0.2", 56940);
// tell the collectives action to ...
q.lilassi.mktl.collectivesDict[\lilassi].action = { |coll|
	q.lilassi.mktl.elAt(\accel).action.value(q.lilassi.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.lilassi.mktl.elAt(\gyro).action.value(q.lilassi.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.lilassi.mktl.resetActions;

/*
q.lilassi.mktl.elAt(\accel, 2).action_({ |el| [el.name, el.value.round(0.0001)].postcs });
q.lilassi.mktl.elAt(\accel, 2).resetAction;
(
q.lilassi.mktl.elAt(\gyro, \yaw).action_({ |el|
	"yaw % value: %\n".postf(el.parent.indexOf(el), el.value)
});
);

q.lilassi.mktl.postElements;
q.lilassi.mktl.desc.openFile;
q.lilassi.mktl.elementGroup.keys;
*/

OSCFunc.trace;
OSCFunc.trace(false);
q.vermelhodo1.mktl = MKtl(\vermelhodo1, "skmecs-tubo", multiIndex: 1);
{ q.vermelhodo1.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.vermelhodo1.mktl.device.updateSrcAddr("192.168.0.3", 51614);
// tell the collectives action to ...
q.vermelhodo1.mktl.collectivesDict[\vermelhodo1].action = { |coll|
	q.vermelhodo1.mktl.elAt(\accel).action.value(q.vermelhodo1.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.vermelhodo1.mktl.elAt(\gyro).action.value(q.vermelhodo1.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.vermelhodo1.mktl.resetActions;

q.vermelhodo2.mktl = MKtl(\vermelhodo2, "skmecs-tubo", multiIndex: 2);
// q.vermelhodo2.mktl.gui.parent.alwaysOnTop_(true);
q.vermelhodo2.mktl.collectivesDict[\vermelhodo2].action = { |coll|
	q.vermelhodo2.mktl.elAt(\accel).action.value(q.vermelhodo2.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.vermelhodo2.mktl.elAt(\gyro).action.value(q.vermelhodo2.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.vermelhodo2.mktl.resetActions;

q.laranjare.mktl = MKtl(\laranjare, "skmecs-tubo", multiIndex: 3);
{ q.laranjare.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.laranjare.mktl.device.updateSrcAddr("192.168.0.5", 51616);
q.laranjare.mktl.collectivesDict[\laranjare].action = { |coll|
	q.laranjare.mktl.elAt(\accel).action.value(q.laranjare.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.laranjare.mktl.elAt(\gyro).action.value(q.laranjare.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.laranjare.mktl.resetActions;

q.amarelomi.mktl = MKtl(\amarelomi, "skmecs-tubo", multiIndex: 4);
{ q.amarelomi.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.amarelomi.mktl.device.updateSrcAddr("192.168.0.6", 51615);
q.amarelomi.mktl.collectivesDict[\amarelomi].action = { |coll|
	q.amarelomi.mktl.elAt(\accel).action.value(q.amarelomi.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.amarelomi.mktl.elAt(\gyro).action.value(q.amarelomi.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.amarelomi.mktl.resetActions;

q.verdefa1.mktl = MKtl(\verdefa1, "skmecs-tubo", multiIndex: 5);
{ q.verdefa1.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.verdefa1.mktl.device.updateSrcAddr("192.168.0.7", 51615);
q.verdefa1.mktl.collectivesDict[\verdefa1].action = { |coll|
	q.verdefa1.mktl.elAt(\accel).action.value(q.verdefa1.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.verdefa1.mktl.elAt(\gyro).action.value(q.verdefa1.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.verdefa1.mktl.resetActions;

q.verdefa2.mktl = MKtl(\verdefa2, "skmecs-tubo", multiIndex: 6);
/*
q.verdefa2.mktl.gui.parent.alwaysOnTop_(true);
q.verdefa2.mktl.device.updateSrcAddr("192.168.0.7", 51615);
*/
q.verdefa2.mktl.collectivesDict[\verdefa2].action = { |coll|
	q.verdefa2.mktl.elAt(\accel).action.value(q.verdefa2.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.verdefa2.mktl.elAt(\gyro).action.value(q.verdefa2.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.verdefa2.mktl.resetActions;

q.verdesol.mktl = MKtl(\verdesol, "skmecs-tubo", multiIndex: 7);
{ q.verdesol.mktl.gui.parent.alwaysOnTop_(true) }.defer;
// q.verdesol.mktl.device.updateSrcAddr("192.168.0.8", 51615);
q.verdesol.mktl.collectivesDict[\verdesol].action = { |coll|
	q.verdesol.mktl.elAt(\accel).action.value(q.verdesol.mktl.elAt(\accel));
	coll.do { |elem| elem.action.value(elem) };
	q.verdesol.mktl.elAt(\gyro).action.value(q.verdesol.mktl.elAt(\gyro));
	coll.do { |elem| elem.action.value(elem) };
};
q.verdesol.mktl.resetActions;

{ o = OSCMon.new.enable.show }.defer;