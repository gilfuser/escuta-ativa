q.f = FileWriter( "/movimento.txt", "w", stamp: true, del: $,);

s.record;
Task({
	22500.do{
		q.f.writeLine( q.data );
		25.reciprocal.wait;
	};
	"recording data is done".postln;
	s.stopRecording
}).play;

// 15 minutos