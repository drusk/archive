//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 2006-2008 OpenSim Ltd.
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

package org.omnetpp.queueing;

//
// A queue with a built-in server
//
simple Queue
{
    parameters:
        @group(Queueing);
        @display("i=block/queue;q=queue");
        @signal[dropped](type="int");
        @signal[queueLength](type="int");
        @signal[queueingTime](type="simtime_t");
        @signal[busy](type="bool");
        @signal[serviceTime](type="simtime_t");
        @signal[jobCount](type="int");
        @statistic[dropped](title="drop event";record=vector?,count;interpolationmode=none);
        @statistic[queueLength](title="queue length";record=vector,timeavg,max;interpolationmode=sample-hold);
        @statistic[queueingTime](title="queueing time at dequeue";record=vector?,mean,max;unit=s;interpolationmode=none);
        @statistic[busy](title="server busy state";record=vector?,timeavg;interpolationmode=sample-hold);
		@statistic[serviceTime](title="server service time";record=vector,timeavg;interpolationmode=sample-hold);
		@statistic[jobCount](title="job count";record=vector,timeavg;interpolationmode=sample-hold);	

        int capacity = default(-1);    // negative capacity means unlimited queue
        bool fifo = default(true);     // whether the module works as a queue (fifo=true) or a stack (fifo=false)
        volatile double serviceTime @unit(s);
    gates:
        input in[];
        output out;
}
