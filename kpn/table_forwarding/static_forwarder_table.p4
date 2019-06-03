/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

struct metadata {}
struct headers {}

parser MyParser(packet_in packet, out headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    // your parser always starts in the 'state' state and ends in the 'accept' state
    // As you can see, we did not add any additional states and rules
    state start { transition accept; }
}

// In this step you can implement how there is 'checked' wheter the arrived packet is correct (i.e. not corrupted)
control MyVerifyChecksum(inout headers hdr, inout metadata meta) {
    apply {
        // nothing;
    }
}

// Only here did we implement some additional functionality.
// We will create a table wich implements 'setting the out_port to a certain value'
// Note, this is only the 'definition' of the table. We also need to fill this (this is done via .json)
control MyIngress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {

    action drop() {
        mark_to_drop();
    }

    // action which sets the out_port number
    action set_egress_spec(bit<9> port) {
        standard_metadata.egress_spec = port;
    }

    // definition of the fowarding table, where we match on the in_port and have three possible actions.
    table forward {
        key = { standard_metadata.ingress_port: exact; }
        actions = {
            set_egress_spec;
            drop;
            NoAction;
        }
        size = 1024;
        default_action = NoAction();
    }

    apply {
        forward.apply();
    }
}

control MyEgress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {
        // nothing;
    }
}

// In this step you can implement how to set the checksum that is used to calculate the correctness of a packet
control MyComputeChecksum(inout headers hdr, inout metadata meta) {
    apply {
        // nothing
    }
}

// Here you can specify in which order certain headers of your packet
// Because we don't specify any headers or something like that, we can skip this.
control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        // nothing
    }
}

// Defenition of the switch and the steps it takes
V1Switch(
    MyParser(),
    MyVerifyChecksum(),
    MyIngress(),
    MyEgress(),
    MyComputeChecksum(),
    MyDeparser()
) main;
