q.lilassi.mktl.device.updateSrcAddr( "127.0.0.1", 57121 );
q.vermelhodo1.mktl.device.updateSrcDstAddr( "127.0.0.1", 57122 );
// q.vermelhodo2.mktl.device.updateSrcAddr( "127.0.0.1", 57123 );
q.laranjare.mktl.device.updateSrcAddr("127.0.0.1", 57123 );
q.amarelomi.mktl.device.updateSrcAddr( "127.0.0.1", 57124 );
q.verdefa1.mktl.device.updateSrcAddr( "127.0.0.1", 57125 );
// q.verdefa2.mktl.device.updateSrcAddr( "127.0.0.1", 57127 );
q.verdesol.mktl.device.updateSrcAddr( "127.0.0.1", 57126 );

(
Tdef(\toca, {
	loop{
		(q.lineNum -1).do{ |i|
			/*q.lilassi.dataLog.readAtLineInterpret(i % q.lineNum).collect{ |el i|
				switch (i)
				{0} {q.lilassi.mktl.elAt(\gyro, \yaw).value = el.linlin(-180, 180, 0.0, 1)}
				{1} {q.lilassi.mktl.elAt(\gyro, \pitch).value = el.linlin(-180, 180, 0.0, 1)}
				{2} {q.lilassi.mktl.elAt(\gyro, \roll).value = el.linlin(-180, 180, 0.0, 1)}
				{3} {q.lilassi.mktl.elAt(\accel, \x).value = el.linlin(-16384, 16384, 0.0, 1)}
				{4} {q.lilassi.mktl.elAt(\accel, \y).value = el.linlin(-16384, 16384, 0.0, 1)}
				{5} {q.lilassi.mktl.elAt(\accel, \z).value = el.linlin(-16384, 16384, 0.0, 1)};
			};
			q.vermelhodo1.dataLog.readAtLineInterpret(i % q.lineNum).collect{ |el i|
				switch (i)
				{0} {q.vermelhodo1.mktl.elAt(\gyro, \yaw).value = el.linlin(-180, 180, 0.0, 1)}
				{1} {q.vermelhodo1.mktl.elAt(\gyro, \pitch).value = el.linlin(-180, 180, 0.0, 1)}
				{2} {q.vermelhodo1.mktl.elAt(\gyro, \roll).value = el.linlin(-180, 180, 0.0, 1)}
				{3} {q.vermelhodo1.mktl.elAt(\accel, \x).value = el.linlin(-16384, 16384, 0.0, 1)}
				{4} {q.vermelhodo1.mktl.elAt(\accel, \y).value = el.linlin(-16384, 16384, 0.0, 1)}
				{5} {q.vermelhodo1.mktl.elAt(\accel, \z).value = el.linlin(-16384, 16384, 0.0, 1)};
			};*/
			// q.localnet.sendMsg('/vermelhodo2', *(q.vermelhodo2.dataLog.readAtLineInterpret(i % q.lineNum)) );
			q.lilassi.localnet.sendMsg(\lilassi, *(q.lilassi.dataLog.readAtLineInterpret(60 % q.lineNum)) );
			// q.localnet.sendMsg(\amarelomi, *( q.amarelomi.dataLog.readAtLineInterpret(i % q.lineNum)) );
			/*q.localnet.sendMsg(
				q.verdefa1.dataLog.readAtLine(i % q.lineNum).at(0).asSymbol,
				*(q.verdefa1.dataLog.readAtLineInterpret(i % q.lineNum).drop(1))
			);*/
			// q.localnet.sendMsg('/verdesol', *( q.verdesol.dataLog.readAtLineInterpret(i % q.lineNum)) );
			25.reciprocal.wait;
		};
		q.lilassi.dataLog.reset;
		q.vermelhodo1.dataLog.reset;
		"volta ao comeco".postln;
	}
})//.play;
);
Tdef(\toca).gui;

q.localnet.sendMsg(\lilassi, *(q.lilassi.dataLog.readAtLineInterpret(1)) );
